class OpenSettingsImpl: OpenSettings {
  func openSettings() throws {
    if let url = URL(string: UIApplication.openSettingsURLString) {
      UIApplication.shared.open(url)
    }
  }
}
