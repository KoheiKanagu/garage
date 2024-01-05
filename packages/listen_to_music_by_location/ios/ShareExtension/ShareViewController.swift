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
    // typesに com.apple.group-activities.activity が含まれる場合があるのでURLだけを取得
    guard
      let inputItem = extensionContext?.inputItems.first as? NSExtensionItem,
      let itemProvider = inputItem.attachments?.first(
        where: {
          $0.hasItemConformingToTypeIdentifier(UTType.url.identifier)
        }
      )
    else {
      return false
    }

    do {
      let data = try await itemProvider.loadItem(
        forTypeIdentifier: UTType.url.identifier,
        options: nil
      )

      // URLをエンコードして渡す
      // Bundle Identifierを見てschemeを切り替える
      guard let url = data as? NSURL,
        let encodedUrl = url.absoluteString?.addingPercentEncoding(
          withAllowedCharacters: .urlHostAllowed
        ),
        let urlScheme =
          Bundle.main.bundleIdentifier == "dev.kingu.listenToMusicByLocation.dev.ShareExtension"
          ? "loca-music-dev" : "loca-music",
        let openAppUrl = NSURL(string: "\(urlScheme)://shared/\(encodedUrl)")
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
