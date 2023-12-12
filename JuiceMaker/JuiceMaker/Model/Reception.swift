
import Foundation

struct Reception {
    
    private let juiceMaker = JuiceMaker()
    
    func acceptJuiceOrder(juiceType: JuiceType) {
        switch juiceType {
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
    
    func acceptStockManageOrder(fruit: FruitStore.Fruits) {
    }
    
    func fetchInitialFruitsStock() -> [FruitStore.Fruits: Int] {
        return juiceMaker.fruitStore.fruitsStock
    }
}



