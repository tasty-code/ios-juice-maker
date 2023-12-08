
import Foundation

// MARK: - FruitStore 초기화

final class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry, mango, banana, kiwi, pineapple
    }
    
    var fruitsStock = Dictionary(uniqueKeysWithValues: Fruits.allCases.map {($0, 10)})
}

// MARK: - FruitStore 메서드

extension FruitStore {
    func incrementFruit(fruit: Fruits, quantities: Int) {
        guard let currentStock = fruitsStock[fruit] else { print("\(#function) 에러 발생!"); return }
        fruitsStock[fruit] = currentStock + quantities
    }
    
    func decrementFruit(fruit: Fruits, quantities: Int) {
        guard let currentStock = fruitsStock[fruit], currentStock - quantities > 0 else { print("\(#function) 재고 부족!"); return }
        fruitsStock[fruit] = currentStock - quantities
    }
}

