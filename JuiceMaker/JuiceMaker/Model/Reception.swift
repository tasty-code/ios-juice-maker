
import Foundation

struct Reception {
    
    private let juiceMaker: JuiceMaker
    private let fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore()
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
    
    func applyCurrentStocks() {
        fruitStore.onUpdateStock()
    }
        
    
    func acceptJuiceOrder(of type: JuiceType) {
        switch type {
        case .strawberry:
            juiceMaker.makeStrawberryJuice()
            
        case .banana:
            juiceMaker.makeBananaJuice()
            
        case .kiwi:
            juiceMaker.makeKiwiJuice()
            
        case .mango:
            juiceMaker.makeMangoJuice()
            
        case .pineapple:
            juiceMaker.makePineappleJuice()
            
        case .ddalba:
            juiceMaker.makeDdalbaJuice()
            
        case .mangki:
            juiceMaker.makeMangkiJuice()
        }
    }
}



