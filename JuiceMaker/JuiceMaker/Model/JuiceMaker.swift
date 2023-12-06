
import Foundation

//MARK: - JuiceMaker 초기화
struct JuiceMaker {
    
    private let fruitStore = FruitStore()

}

//MARK: - JuiceMaker 메서드
extension JuiceMaker {
    
    private func makeStrawberryJuice() {
        fruitStore.decrementFruit(of: .strawberry, at: 16)
    }
    
    private func makeBananaJuice() {
        fruitStore.decrementFruit(of: .banana, at: 2)
    }

    
    private func makeKiwiJuice() {
        fruitStore.decrementFruit(of: .kiwi, at: 3)
    }

    
    private func makePineappleJuice() {
        fruitStore.decrementFruit(of: .pineapple, at: 2)
    }

    
    private func makeDdalbaJuice() {
        fruitStore.decrementFruit(of: .strawberry, at: 10)
        fruitStore.decrementFruit(of: .banana, at: 1)
    }

    
    private func makeMangoJuice() {
        fruitStore.decrementFruit(of: .mango, at: 3)
    }

    private func makeMangkiJuice() {
        fruitStore.decrementFruit(of: .mango, at: 2)
        fruitStore.decrementFruit(of: .kiwi, at: 1)
    }
}
