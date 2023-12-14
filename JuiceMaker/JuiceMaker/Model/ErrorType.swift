
import Foundation

enum ErrorType {
    case limitedStockError(String)
    case notificationCenterError(String)
    
    func printMessage() {
        switch self {
        case .limitedStockError(let customMessage), .notificationCenterError(let customMessage):
            print(customMessage)
        }
    }
}

