
import Foundation

enum Request {
    case juiceOrder
    case stockManage
}

extension Request {
    func acceptJuiceOrder(juiceType: JuiceType) {
        
        switch self {
        case .juiceOrder:
            let juiceMaker = JuiceMaker()
            
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
            
        case .stockManage:
            break
            
        }
    }
}

