import CoreLocation
import Flutter
import UIKit
import app_links

@main
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
      MapViewType.mapPage,
      MapViewType.locamusicDetailPage,
    ] {
      registrar(
        forPlugin: "\(e)"
      )?.register(
        MyMapFlutterPlatformViewFactory(
          mapViewType: e,
          flutterBinaryMessenger: controller.binaryMessenger
        ),
        withId: "\(e)",
        // https://github.com/flutter/flutter/issues/37579#issuecomment-1933365963
        // これにより、MapViewの上にFlutterのボタンを置いてもジェスチャーの認識がうまくいく
        gestureRecognizersBlockingPolicy:
          FlutterPlatformViewGestureRecognizersBlockingPolicyWaitUntilTouchesEnded
      )
    }

    MusicKitSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: MusicKitImpl()
    )
    LocationManagerSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: LocationManagerImpl(
        locationManagerDelegate: LocationManagerDelegate(
          binaryMessenger: controller.binaryMessenger
        )
      )
    )
    OpenSettingsSetup.setUp(
      binaryMessenger: controller.binaryMessenger,
      api: OpenSettingsImpl()
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

  let mapViewType: MapViewType

  let flutterBinaryMessenger: FlutterBinaryMessenger

  init(
    mapViewType: MapViewType,
    flutterBinaryMessenger: FlutterBinaryMessenger
  ) {
    self.mapViewType = mapViewType
    self.flutterBinaryMessenger = flutterBinaryMessenger
  }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {

    let myMapView = MyMapView(
      args: args,
      mapViewType: mapViewType,
      mapViewDelegate: MapViewDelegate(
        binaryMessenger: flutterBinaryMessenger
      )
    )

    switch mapViewType {
    case .mapPage:
      MapPageMapViewSetup.setUp(
        binaryMessenger: flutterBinaryMessenger,
        api: MapPageMapViewImpl(
          myMapView: myMapView
        )
      )
    case .locamusicDetailPage:
      LocamusicDetailPageMapViewSetup.setUp(
        binaryMessenger: flutterBinaryMessenger,
        api: LocamusicDetailPageMapViewImpl(
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
