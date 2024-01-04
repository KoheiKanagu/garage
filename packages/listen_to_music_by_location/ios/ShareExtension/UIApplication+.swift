// reference: https://shinagawa.app/posts/ios_share_extension/

import UIKit

extension UIApplication {

  // https://stackoverflow.com/a/36925156/4791194
  public static func sharedApplication() -> UIApplication {
    guard UIApplication.responds(to: Selector(("sharedApplication"))) else {
      fatalError(
        "UIApplication.sharedKeyboardApplication(): `UIApplication` does not respond to selector `sharedApplication`."
      )
    }

    guard let unmanagedSharedApplication = UIApplication.perform(Selector(("sharedApplication")))
    else {
      fatalError(
        "UIApplication.sharedKeyboardApplication(): `UIApplication.sharedApplication()` returned `nil`."
      )
    }

    guard let sharedApplication = unmanagedSharedApplication.takeUnretainedValue() as? UIApplication
    else {
      fatalError(
        "UIApplication.sharedKeyboardApplication(): `UIApplication.sharedApplication()` returned not `UIApplication` instance."
      )
    }

    return sharedApplication
  }

  public func openURL(url: NSURL) -> Bool {
    perform(Selector(("openURL:")), with: url) != nil
  }
}
