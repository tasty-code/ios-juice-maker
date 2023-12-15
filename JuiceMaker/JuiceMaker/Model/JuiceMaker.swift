
import Foundation

// MARK: - JuiceMaker 초기화
struct JuiceMaker {
    
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }

}

// MARK: - JuiceMaker 메서드
extension JuiceMaker {
    
    func makeStrawberryJuice() {
        fruitStore.decrement(fruit: .strawberry, by: 16)
    }
    
    func makeBananaJuice() {
        fruitStore.decrement(fruit: .banana, by: 2)
    }

    func makeKiwiJuice() {
        fruitStore.decrement(fruit: .kiwi, by: 3)
    }
    
    func makePineappleJuice() {
        fruitStore.decrement(fruit: .pineapple, by: 2)
    }
    
    func makeDdalbaJuice() {
        fruitStore.decrement(fruit: .strawberry, by: 10)
        fruitStore.decrement(fruit: .banana, by: 1)
    }
    
    func makeMangoJuice() {
        fruitStore.decrement(fruit: .mango, by: 3)
    }

    func makeMangkiJuice() {
        fruitStore.decrement(fruit: .mango, by: 2)
        fruitStore.decrement(fruit: .kiwi, by: 1)
    }
}


