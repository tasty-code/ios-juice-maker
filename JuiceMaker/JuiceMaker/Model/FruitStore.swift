
import Foundation

extension Notification.Name {
    static let fruitStockDidChange = Notification.Name("fruitStockDidChange")
    static let errorOccured = Notification.Name("errorOccured")
}

// MARK: - FruitStore 초기화

final class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry, mango, banana, kiwi, pineapple, cherry
    }
    
    private let limitedQuantity = 0
    private let initialValue = 10
    lazy var fruitsStock = Dictionary(uniqueKeysWithValues: Fruits.allCases.map {($0, initialValue)})
}


// MARK: - FruitStore 메서드

extension FruitStore {
    
    func increment(fruits: [Fruits], by quantities: [Int]) {

        let fruitQuantitiesPairs = Array(zip(fruits, quantities))
        
        for (fruit, quantity) in fruitQuantitiesPairs {
            guard 
                let currentFruitStock = fruitsStock[fruit]
            else {
                postErrorOccurred()
                return
            }
            
            fruitsStock[fruit] = currentFruitStock + quantity
            postFruitsStock()
        }
    }


    func decrement(fruits: [Fruits], by quantities: [Int]) {

        let fruitQuantitiesPairs = Array(zip(fruits, quantities))
        
        for (fruit, quantity) in fruitQuantitiesPairs {
            guard 
                let currentFruitStock = fruitsStock[fruit],
                currentFruitStock-quantity >= limitedQuantity
            else {
                postErrorOccurred()
                return
            }
            
            fruitsStock[fruit] = currentFruitStock - quantity
            postFruitsStock()
        }
    }
    
    func editStock(of type: Fruits, to quantities: Int) {
        fruitsStock[type] = quantities
        postFruitsStock()
    }
    
    func onUpdateStock() {
        postFruitsStock()
    }
}

// MARK: - Notification Center Method

private extension FruitStore {
    func postFruitsStock() {
        NotificationCenter.default.post(name: .fruitStockDidChange, object: nil, userInfo: ["fruitsStock": fruitsStock])
    }
    
    func postErrorOccurred() {
        NotificationCenter.default.post(name: .errorOccured, object: nil)
    }
}
