
import Foundation

//MARK: - JuiceMaker 초기화
struct JuiceMaker {
    
    private let fruitStore = FruitStore()

}

//MARK: - JuiceMaker 메서드
extension JuiceMaker {
    
    func makeStrawberryJuice() {
        fruitStore.decrementFruit(of: .strawberry, at: 16)
    }
    
    func makeBananaJuice() {
        fruitStore.decrementFruit(of: .banana, at: 2)
    }

    
    func makeKiwiJuice() {
        fruitStore.decrementFruit(of: .kiwi, at: 3)
    }

    
    func makePineappleJuice() {
        fruitStore.decrementFruit(of: .pineapple, at: 2)
    }

    
    func makeDdalbaJuice() {
        fruitStore.decrementFruit(of: .strawberry, at: 10)
        fruitStore.decrementFruit(of: .banana, at: 1)
    }

    
    func makeMangoJuice() {
        fruitStore.decrementFruit(of: .mango, at: 3)
    }

    func makeMangkiJuice() {
        fruitStore.decrementFruit(of: .mango, at: 2)
        fruitStore.decrementFruit(of: .kiwi, at: 1)
    }
}


