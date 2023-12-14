
import Foundation

// MARK: - JuiceMaker 초기화
struct JuiceMaker {
    
    let fruitStore = FruitStore()

}

// MARK: - JuiceMaker 메서드
extension JuiceMaker {
    
    func makeStrawberryJuice() {
        fruitStore.decrementFruit(of: .strawberry, by: 16)
    }
    
    func makeBananaJuice() {
        fruitStore.decrementFruit(of: .banana, by: 2)
    }

    func makeKiwiJuice() {
        fruitStore.decrementFruit(of: .kiwi, by: 3)
    }
    
    func makePineappleJuice() {
        fruitStore.decrementFruit(of: .pineapple, by: 2)
    }
    
    func makeDdalbaJuice() {
        fruitStore.decrementFruit(of: .strawberry, by: 10)
        fruitStore.decrementFruit(of: .banana, by: 1)
    }
    
    func makeMangoJuice() {
        fruitStore.decrementFruit(of: .mango, by: 3)
    }

    func makeMangkiJuice() {
        fruitStore.decrementFruit(of: .mango, by: 2)
        fruitStore.decrementFruit(of: .kiwi, by: 1)
    }
}


