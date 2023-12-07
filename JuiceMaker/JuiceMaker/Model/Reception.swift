
import Foundation

enum Request {
    case juiceOrder
    case stockManage
}


struct Reception {

    private let juiceMaker = JuiceMaker()

    func acceptOrder(request: Request, juiceType: JuiceType? = nil) {
        
        switch request {
        case .juiceOrder:
            
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
                
            case .none:
                break
            }
            
        case .stockManage:
            break
            
        }
    }
}

