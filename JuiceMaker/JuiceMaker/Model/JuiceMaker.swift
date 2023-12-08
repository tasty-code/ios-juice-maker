
import Foundation

// MARK: - JuiceMaker 초기화
struct JuiceMaker {
    
    private let fruitStore = FruitStore()

}

// MARK: - JuiceMaker 메서드
extension JuiceMaker {
    
    func makeStrawberryJuice() {
        fruitStore.decrementFruit(fruit: .strawberry, quantities: 16)
    }
    
    func makeBananaJuice() {
        fruitStore.decrementFruit(fruit: .banana, quantities: 2)
        
        let nanana: (String, String) = AlertHandler.shared.getAlertMessage(alertType: .fruitShortage("딸기부족합니다~"))
    }

    func makeKiwiJuice() {
        fruitStore.decrementFruit(fruit: .kiwi, quantities: 3)
    }
    
    func makePineappleJuice() {
        fruitStore.decrementFruit(fruit: .pineapple, quantities: 2)
    }
    
    func makeDdalbaJuice() {
        fruitStore.decrementFruit(fruit: .strawberry, quantities: 10)
        fruitStore.decrementFruit(fruit: .banana, quantities: 1)
    }
    
    func makeMangoJuice() {
        fruitStore.decrementFruit(fruit: .mango, quantities: 3)
    }

    func makeMangkiJuice() {
        fruitStore.decrementFruit(fruit: .mango, quantities: 2)
        fruitStore.decrementFruit(fruit: .kiwi, quantities: 1)
    }
}


