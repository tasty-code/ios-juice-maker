import Foundation

enum StockError: String, CustomStringConvertible {
    case notEnoughStrawberryStock = "딸기 재고가 없습니다..."
    case notEnoughBananaStock = "바나나 재고가 없습니다..."
    case notEnoughKiwiStock = "키위 재고가 없습니다..."
    case notEnoughPineAppleStock = "파인애플 재고가 없습니다..."
    case notEnoughMangoStock = "망고 재고가 없습니다..."
    
    var description: String {
        return self.rawValue
    }
}
