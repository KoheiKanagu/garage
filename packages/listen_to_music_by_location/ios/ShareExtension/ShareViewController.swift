// references:
// [iOS の Share Extensionで Safari からアプリを開く](https://shinagawa.app/posts/ios_share_extension/)
// [Swift: Share Extensionから本体アプリを開く](https://zenn.dev/kyome/articles/88876501b05f13)

import SwiftUI
import UniformTypeIdentifiers

class ShareViewController: UIHostingController<ShareView> {
  enum ShareError: Error {
    case cancel
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder, rootView: ShareView())
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    Task {
      _ = await openAppWithUrl()
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    extensionContext?.completeRequest(returningItems: nil)
  }

  private func openAppWithUrl() async -> Bool {
    guard let item = extensionContext?.inputItems.first as? NSExtensionItem,
      let itemProvider = item.attachments?.first
    else {
      return false
    }

    guard itemProvider.hasItemConformingToTypeIdentifier(UTType.url.identifier)
    else {
      return false
    }

    do {
      let data = try await itemProvider.loadItem(
        forTypeIdentifier: UTType.url.identifier,
        options: nil
      )

      // URLをbase64エンコードし、Custom URL Schemeのホスト部に指定してopenURLでアプリを開く
      // Bundle Identifierを見てschemeを切り替える
      guard let url = data as? NSURL,
        let base64EncodedUrl = url.absoluteString?.data(using: .utf8)?.base64EncodedString(),
        let urlScheme =
          Bundle.main.bundleIdentifier == "dev.kingu.listenToMusicByLocation.dev.ShareExtension"
          ? "loca-music-dev" : "loca-music",
        let openAppUrl = NSURL(string: "\(urlScheme)://\(base64EncodedUrl)")
      else {
        return false
      }

      return openContainerApp(
        url: openAppUrl
      )
    } catch let error {
      print(error)
      return false
    }
  }

  func openContainerApp(url: NSURL) -> Bool {
    var responder: UIResponder? = self
    while responder != nil {
      if let application = responder as? UIApplication {
        let selector = sel_registerName("openURL:")
        application.perform(selector, with: url)
        break
      }
      responder = responder?.next
    }
    return true
  }
}
