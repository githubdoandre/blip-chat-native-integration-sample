import Flutter
import UIKit

class BlipChatViewFactory: NSObject, FlutterPlatformViewFactory {
    init(messenger _: FlutterBinaryMessenger) {
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        BlipChatPlatformView(frame: frame, viewIdentifier: viewId, arguments: args)
    }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        FlutterStandardMessageCodec.sharedInstance()
    }
}
