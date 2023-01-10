import Foundation

class FruitStore {
    private(set) var fruitStock: [Fruit: UInt] = {
        let defaultStock: UInt = 10
        
        var stock: [Fruit: UInt] = [:]
        Fruit.allCases.forEach { fruit in
            stock[fruit] = defaultStock
        }
        
        return stock
    }()
    
    func numberOf(fruit: Fruit) throws -> UInt {
        guard let currentStock = fruitStock[fruit] else {
            throw InfoMessage.noFruit
        }
        
        return currentStock
    }
    
    func addStock(for fruit: Fruit, number: UInt) {
        guard let currentNumber = fruitStock[fruit] else { return }
        fruitStock.updateValue(currentNumber + number, forKey: fruit)
    }
    
    func consumeStock(for fruit: Fruit, number: UInt) {
        guard let currentNumber = fruitStock[fruit] else { return }
        guard currentNumber >= number else {
            print(InfoMessage.noStock,
                  "현재 재고: \(currentNumber)",
                  "레시피 수량 : \(number)",
                  "부족한 수량: \(number - currentNumber)" )
            return
        }
        
        fruitStock.updateValue(currentNumber - number, forKey: fruit)
    }
}
