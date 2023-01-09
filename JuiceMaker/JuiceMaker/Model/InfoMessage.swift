import Foundation

enum InfoMessage: LocalizedError {
    case noStock
    case noFruit

        
    
    var errorDescription: String? {
        switch self {
        case .noStock:
            return "재고가 부족합니다"
        case .noFruit:
            return "등록된 과일이 없습니다"
        }
    }
}
