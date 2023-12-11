
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
    
    func getFruitsStock(fruit: FruitStore.Fruits) -> Int {
        switch fruit {
        case .banana:
            return juiceMaker.fruitStore.fruitsStock[.banana] ?? 0
        case .strawberry:
            return juiceMaker.fruitStore.fruitsStock[.strawberry] ?? 0
        case .kiwi:
            return juiceMaker.fruitStore.fruitsStock[.kiwi] ?? 0
        case .mango:
            return juiceMaker.fruitStore.fruitsStock[.mango] ?? 0
        case .pineapple:
            return juiceMaker.fruitStore.fruitsStock[.pineapple] ?? 0
        }
    }
}



