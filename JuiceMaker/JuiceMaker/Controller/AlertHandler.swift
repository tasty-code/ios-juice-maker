
import UIKit

enum AlertType {
    case successJuiceOrder(String)
    case fruitShortage(String)
}

final class AlertHandler {
    
    static let shared = AlertHandler()
    
    private init() {}
    
    private func fetchTopVC() -> UIViewController? {
        var currentVC = UIApplication.shared.keyWindow?.rootViewController
        while let nextVC = currentVC?.presentedViewController {
            currentVC = nextVC
        }
        return currentVC ?? nil
    }
    
    private func fetchAlertMessage(of type: AlertType) -> (String, String) {
        switch type {
        case .fruitShortage(let customMessage):
            return ("재고부족!", customMessage)
        case .successJuiceOrder(let customMessage):
            return ("주스제조성공!", customMessage)
        }
    }
    
    private func generateAlert(of type: AlertType) -> UIAlertController {
        let (title, message) = fetchAlertMessage(of: type)
        var alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alertView
    }
    
    func presentAlert(of type: AlertType, completion: @escaping (UIAlertAction) -> Void) {
        let topViewController = fetchTopVC()
        let alertView = generateAlert(of: type)
        alertView.addAction(UIAlertAction(title: "아니오", style: .default))
        alertView.addAction(UIAlertAction(title: "예", style: .default, handler: completion))
        topViewController?.present(alertView, animated: true)
    }
}



















