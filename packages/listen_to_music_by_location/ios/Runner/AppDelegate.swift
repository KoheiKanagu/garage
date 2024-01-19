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
    let myFlutterApi = MyFlutterApi(
      binaryMessenger: controller.binaryMessenger
    )

    registrar(
      forPlugin: "MyMapView"
    )?.register(
      MyMapFlutterPlatformViewFactory(
        controller: controller,
        myFlutterApi: myFlutterApi,
        isInteractive: true
      ),
      withId: "my_map_platform_view"
    )

    registrar(
      forPlugin: "MyNonInteractiveMapView"
    )?.register(
      MyMapFlutterPlatformViewFactory(
        controller: controller,
        myFlutterApi: myFlutterApi,
        isInteractive: false
      ),
      withId: "my_non_interactive_map_platform_view"
    )

    MyMusicHostApiSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: MyMusicHostApiImpl()
    )
    MyLocationHostApiSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: MyLocationHostApiImpl(
        myFlutterApi: myFlutterApi
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

  let controller: FlutterViewController

  let myFlutterApi: MyFlutterApi

  let isInteractive: Bool

  init(
    controller: FlutterViewController,
    myFlutterApi: MyFlutterApi,
    isInteractive: Bool
  ) {
    self.controller = controller
    self.myFlutterApi = myFlutterApi
    self.isInteractive = isInteractive
  }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {

    var myMapView: MyMapView

    if isInteractive {
      myMapView = MyMapView(
        args: args,
        flutterApi: myFlutterApi
      )
      MyMapHostApiSetup.setUp(
        binaryMessenger: controller.binaryMessenger,
        api: MyMapHostApiImpl(
          myMapView: myMapView
        )
      )
    } else {
      myMapView = MyMapView(
        args: args,
        flutterApi: nil
      )
      MyNonInteractiveMapHostApiSetup.setUp(
        binaryMessenger: controller.binaryMessenger,
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
