import CoreLocation
import Flutter
import UIKit
import app_links

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(
      with: self
    )

    let controller = window?.rootViewController as! FlutterViewController

    for e in [
      MyMapViewType.interactive,
      MyMapViewType.nonInteractive,
    ] {
      registrar(
        forPlugin: "\(e)"
      )?.register(
        MyMapFlutterPlatformViewFactory(
          myMapViewType: e,
          flutterBinaryMessenger: controller.binaryMessenger
        ),
        withId: "\(e)"
      )
    }

    MyMusicHostApiSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: MyMusicHostApiImpl()
    )
    MyLocationHostApiSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: MyLocationHostApiImpl(
        myFlutterApi: MyFlutterApi(
          binaryMessenger: controller.binaryMessenger
        )
      )
    )

    if let url = AppLinks.shared.getLink(launchOptions: launchOptions) {
      AppLinks.shared.handleLink(url: url)
    }

    return super.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
  }
}

class MyMapFlutterPlatformViewFactory: NSObject, FlutterPlatformViewFactory {

  let myMapViewType: MyMapViewType

  let flutterBinaryMessenger: FlutterBinaryMessenger

  init(
    myMapViewType: MyMapViewType,
    flutterBinaryMessenger: FlutterBinaryMessenger
  ) {
    self.myMapViewType = myMapViewType
    self.flutterBinaryMessenger = flutterBinaryMessenger
  }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {

    let myMapView = MyMapView(
      args: args,
      myMapViewType: myMapViewType,
      myFlutterApiMapViewDelegate: MyFlutterApiMapViewDelegate(
        binaryMessenger: flutterBinaryMessenger
      )
    )

    switch myMapViewType {
    case .interactive:
      MyMapHostApiSetup.setUp(
        binaryMessenger: flutterBinaryMessenger,
        api: MyMapHostApiImpl(
          myMapView: myMapView
        )
      )
    case .nonInteractive:
      MyNonInteractiveMapHostApiSetup.setUp(
        binaryMessenger: flutterBinaryMessenger,
        api: MyNonInteractiveMapHostApiImpl(
          myMapView: myMapView
        )
      )
    }

    return MyMapFlutterPlatformView(
      myMapView: myMapView
    )
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }
}

class MyMapFlutterPlatformView: NSObject, FlutterPlatformView {

  let myMapView: MyMapView

  init(myMapView: MyMapView) {
    self.myMapView = myMapView
  }

  func view() -> UIView {
    return myMapView
  }
}
