
import Foundation

extension Notification.Name {
    static let fruitStockDidChange =
    Notification.Name("fruitStockDidChange")
}

// MARK: - FruitStore 초기화

final class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry, mango, banana, kiwi, pineapple
    }
    
    var fruitsStock : [Fruits: Int]
    private let limitedQuantity = 0
    
    init() {
        fruitsStock = Dictionary(uniqueKeysWithValues: Fruits.allCases.map {($0, 10)})
        postFruitsStock()
    }
}


// MARK: - FruitStore 메서드

extension FruitStore {
    func incrementFruit(fruit: Fruits, quantities: Int) {
        guard let currentStock = fruitsStock[fruit] else { print("\(#function) 에러 발생!")
            return
        }
        fruitsStock[fruit] = currentStock + quantities
        postFruitsStock()
    }
    
    func decrementFruit(fruit: Fruits, quantities: Int) {
        guard let currentStock = fruitsStock[fruit],
              currentStock - quantities >= limitedQuantity else {
            print("\(#function) 재고 부족!")
            return
        }
        fruitsStock[fruit] = currentStock - quantities
        postFruitsStock()
    }
}

// MARK: - Notification Center Method

private extension FruitStore {
    func postFruitsStock() {
        NotificationCenter.default.post(name: .fruitStockDidChange, object: nil, userInfo: ["fruitsStock": fruitsStock])
    }
}
