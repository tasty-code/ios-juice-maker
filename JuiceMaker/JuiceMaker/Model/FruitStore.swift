
import Foundation

extension Notification.Name {
    static let fruitStockDidChange = Notification.Name("fruitStockDidChange")
}

// MARK: - FruitStore 초기화

final class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry, mango, banana, kiwi, pineapple
    }
    
    var fruitsStock : [Fruits: Int]
    private let limitedQuantity = 0
    
    init() {
        let initialValue = 10
        fruitsStock = Dictionary(uniqueKeysWithValues: Fruits.allCases.map {($0, initialValue)})
        postFruitsStock()
    }
}


// MARK: - FruitStore 메서드

extension FruitStore {
    func increment(fruit type: Fruits, by quantities: Int) {
        guard let currentStock = fruitsStock[type] else {
            ErrorType.limitedStockError("\(#function)문제발생").printMessage()
            return
        }
        fruitsStock[type] = currentStock + quantities
        postFruitsStock()
    }
    
    func decrement(fruit type: Fruits, by quantities: Int) {
        guard let currentStock = fruitsStock[type],
            currentStock - quantities >= limitedQuantity else {
            ErrorType.limitedStockError("\(#function)문제발생! 재고부족!").printMessage()
            return
        }
        fruitsStock[type] = currentStock - quantities
        postFruitsStock()
    }
}

// MARK: - Notification Center Method

private extension FruitStore {
    func postFruitsStock() {
        NotificationCenter.default.post(name: .fruitStockDidChange, object: nil, userInfo: ["fruitsStock": fruitsStock])
    }
}
