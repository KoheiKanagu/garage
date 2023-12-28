import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(
      with: self
    )

    let myViewFactory = MyMapFlutterPlatformViewFactory()
    registrar(
      forPlugin: "MyMapView"
    )?.register(
      myViewFactory,
      withId: "my_map_platform_view"
    )

    return super.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
  }
}

class MyMapFlutterPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {

    return MyMapFlutterPlatformView(
      frame: frame,
      args: args
    )
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }
}

class MyMapFlutterPlatformView: NSObject, FlutterPlatformView {

  let myMapView: MyMapView

  init(
    frame: CGRect,
    args: Any?
  ) {
    myMapView = MyMapView(
      args: args
    )
  }

  func view() -> UIView {
    return myMapView
  }

}
