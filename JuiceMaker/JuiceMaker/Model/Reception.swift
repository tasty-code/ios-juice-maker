
import Foundation

struct Reception {
    
    var juiceMaker: JuiceMaker
    let fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore()
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
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
    
    func fetchInitialFruitsStock() -> [FruitStore.Fruits: Int]{
        return fruitStore.fruitsStock
    }
}



