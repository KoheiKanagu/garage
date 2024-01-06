import Flutter
import UIKit
import app_links
import CoreLocation

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

    let myViewFactory = MyMapFlutterPlatformViewFactory(
      controller: controller,
      myFlutterApi: myFlutterApi
    )
    registrar(
      forPlugin: "MyMapView"
    )?.register(
      myViewFactory,
      withId: "my_map_platform_view"
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

    init(controller: FlutterViewController, myFlutterApi: MyFlutterApi) {
        self.controller = controller
        self.myFlutterApi = myFlutterApi
    }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {

    let myMapView = MyMapView(
      args: args,
      flutterApi: myFlutterApi
    )

    MyMapHostApiSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: myMapView
    )

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
