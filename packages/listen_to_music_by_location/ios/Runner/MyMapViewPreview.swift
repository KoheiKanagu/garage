import SwiftUI

struct MyMapUIViewRepresentable: UIViewRepresentable {
  let args: Any?

  init(
    args: Any?
  ) {
    self.args = args
  }

  func makeUIView(
    context: Context
  ) -> some UIView {
    return MyMapFlutterPlatformView(
      frame: UIScreen.main.bounds,
      args: args
    ).view()
  }

  func updateUIView(
    _ uiView: UIViewType,
    context: Context
  ) {
  }
}

struct MyMap_Previews: PreviewProvider {
  static var previews: some View {
    return MyMapUIViewRepresentable(
      args: [
        "latitude": 37.334900,
        "longitude": -122.009020,
        "meters": 500
      ]
    )
  }
}
