import Foundation

class FruitStore {
    private let defaultStock: UInt = 10

    private(set) lazy var fruitStock: [Fruit : UInt] = {
        var stock: [Fruit : UInt] = [:]
        Fruit.allCases.forEach { fruit in
            stock[fruit] = defaultStock
        }
        return stock
    }()
    
    func addStock(for fruit: Fruit, number: UInt) {
        guard let currentNumber = fruitStock[fruit] else { return }
        fruitStock.updateValue(currentNumber + number, forKey: fruit)
    }
    
    func consumeStock(for fruit: Fruit, number: UInt) {
        guard let currentNumber = fruitStock[fruit] else { return }
        guard currentNumber >= number else {
            print(InfoMessage.noStock.rawValue)
            return
        }
        fruitStock.updateValue(currentNumber - number, forKey: fruit)
    }
}
