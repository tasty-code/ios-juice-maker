
import UIKit

enum AlertType {
    case successJuiceOrder(String)
    case fruitShortage(String)
}

final class AlertHandler {
    
    static let shared = AlertHandler()
    
    private init() {}
    
    func getCurrentVC(head: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController {
        var currentVC = head
        while let nextVC = currentVC?.presentedViewController {
            currentVC = nextVC
        }
        return currentVC!
    }
    
    func getAlertMessage(alertType: AlertType) -> (String,String) {
        switch alertType {
        case .fruitShortage(let customeMessage):
            return ("재고부족!", customeMessage)
        case .successJuiceOrder(let customeMessage):
            return ("주스제조성공!", customeMessage)
        }
    }
    
    //Alert창 코드 마저 구현하기
}







    
        
    

    
    






