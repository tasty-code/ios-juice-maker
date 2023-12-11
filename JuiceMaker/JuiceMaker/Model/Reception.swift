
import Foundation

struct Reception {
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore()
    
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
            print(fruitStore.fruitsStock[.banana])
            return fruitStore.fruitsStock[.banana] ?? 0
        case .strawberry:
            return fruitStore.fruitsStock[.strawberry] ?? 0
        case .kiwi:
            return fruitStore.fruitsStock[.kiwi] ?? 0
        case .mango:
            return fruitStore.fruitsStock[.mango] ?? 0
        case .pineapple:
            return fruitStore.fruitsStock[.pineapple] ?? 0
        }
    }
}



