
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
    
    private func fetchAlertMessage(alertType: AlertType) -> (String,String) {
        switch alertType {
        case .fruitShortage(let customeMessage):
            return ("재고부족!", customeMessage)
        case .successJuiceOrder(let customeMessage):
            return ("주스제조성공!", customeMessage)
        }
    }
    
    private func generateAlert(of type: AlertType) -> UIAlertController {
        let (title, message) = fetchAlertMessage(alertType: type)
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alertView
    }
    
    func presentAlert(of type: AlertType) {
        let topViewController = fetchTopVC()
        let alertView = generateAlert(of: type)
        topViewController?.present(alertView, animated: true)
    }
}



















