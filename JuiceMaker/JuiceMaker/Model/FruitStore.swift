
import Foundation

extension Notification.Name {
    static let fruitStockDidChange = Notification.Name("fruitStockDidChange")
    static let errorOccured = Notification.Name("errorOccured")
}


// MARK: - FruitStore 초기화

final class FruitStore {
        
    private let limitedQuantity = 0
    private let initialQunatity = 10
    lazy var fruitsStock = Dictionary(uniqueKeysWithValues: FruitsType.allCases.map {($0, initialQunatity)})
    
    init() {
        updateStock()
    }
}


// MARK: - FruitStore 메서드

extension FruitStore {
    
    func increment(fruits: [FruitsType], by quantities: [Int]) {

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


    func decrement(fruits: [FruitsType], by quantities: [Int]) {

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
    
    func editStock(of type: FruitsType, to quantities: Int) {
        fruitsStock[type] = quantities
        postFruitsStock()
    }
    
    func updateStock() {
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
