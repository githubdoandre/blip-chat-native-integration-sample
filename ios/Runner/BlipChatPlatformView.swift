import Flutter
import UIKit
import BlipChat

class BlipChatPlatformView: NSObject, FlutterPlatformView {
    private let containerView: UIView
    private weak var chatViewController: UIViewController?

    init(frame: CGRect, viewIdentifier _: Int64, arguments args: Any?) {
        containerView = UIView(frame: frame)
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        super.init()

        guard
            let params = args as? [String: String],
            let appKey = params["appKey"]
        else { return }

        DispatchQueue.main.async { [weak self] in
            self?.embedChat(appKey: appKey)
        }
    }

    func view() -> UIView { containerView }

    private func embedChat(appKey: String) {
        let options = BlipOptions()

        guard let parentVC = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?
            .rootViewController
        else { return }

        do {
            let chatVC = try BlipClient.getBlipThreadViewController(appKey: appKey, options: options)
            NSLog("BlipChat AppKey: %@", appKey)
            NSLog("BlipChat BundleId: %@", Bundle.main.bundleIdentifier ?? "unknown")
            parentVC.addChild(chatVC)
            chatVC.view.frame = containerView.bounds
            chatVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            containerView.addSubview(chatVC.view)
            chatVC.didMove(toParent: parentVC)
            chatViewController = chatVC
        } catch {
            NSLog("BlipChatPlatformView error: %@", error.localizedDescription)
        }
    }

    deinit {
        chatViewController?.willMove(toParent: nil)
        chatViewController?.view.removeFromSuperview()
        chatViewController?.removeFromParent()
    }
}
