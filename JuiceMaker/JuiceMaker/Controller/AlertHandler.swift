
import UIKit

protocol PresentationDelegate {
    func presentAlert(with type: AlertType, title: String, message: String, completion: @escaping (UIAlertAction) -> Void)
    func presentAelrt(with type: AlertType, title: String, message: String)}

enum AlertType {
    case successJuiceOrder
    case fruitShortage
}

final class AlertHandler: PresentationDelegate {
    
    private func fetchTopVC() -> UIViewController? {
        var currentVC = UIApplication.shared.windows.first?.rootViewController
        while let nextVC = currentVC?.presentedViewController {
            currentVC = nextVC
        }
        return currentVC ?? nil
    }
        
    private func generateAlert(of type: AlertType, title: String, message: String) -> UIAlertController {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alertView
    }
    
    func presentAlert(with type: AlertType, title: String, message: String, completion: @escaping (UIAlertAction) -> Void) {
        let topViewController = fetchTopVC()
        if topViewController is UIAlertController { return }
        let alertView = generateAlert(of: type, title: title, message: message)
        alertView.addAction(UIAlertAction(title: "아니오", style: .default))
        alertView.addAction(UIAlertAction(title: "예", style: .default, handler: completion))
        topViewController?.present(alertView, animated: true)
    }
    
    func presentAelrt(with type: AlertType, title: String, message: String) {
        let topViewController = fetchTopVC()
        if topViewController is UIAlertController { return }
        let alertView = generateAlert(of: type, title: title, message: message)
        alertView.addAction(UIAlertAction(title: "확인", style: .default))
        topViewController?.present(alertView, animated: true)
    }

}

