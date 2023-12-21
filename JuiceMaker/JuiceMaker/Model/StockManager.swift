
import Foundation

// MARK: - StockManager 초기화
struct StockManager {
    
    var fruitStore: FruitStore?
}

// MARK: - StockManager 메서드
extension StockManager {
    
    func manageStrawberryStock(by quantities: Int) {
        fruitStore?.editStock(of: .strawberry, to: quantities)
    }
    
    func manageBananaStock(by quantities: Int) {
        fruitStore?.editStock(of: .banana, to: quantities)
    }
    
    func managePineappleStock(by quantities: Int) {
        fruitStore?.editStock(of: .pineapple, to: quantities)
    }
    
    func manageKiwiStock(by quantities: Int) {
        fruitStore?.editStock(of: .kiwi, to: quantities)
    }
    
    func manageMangoStock(by quantities: Int) {
        fruitStore?.editStock(of: .mango, to: quantities)
    }
    
    func updateStock() {
        fruitStore?.updateStock()
    }
}
