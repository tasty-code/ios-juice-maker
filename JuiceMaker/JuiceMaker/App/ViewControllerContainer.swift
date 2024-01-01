
import UIKit

final class ViewControllerContainer {
    static let shared = ViewControllerContainer()
    
    private init() {}
    
    private var services: [String: Any] = [:]
    
    func bind<Service>(service: Service.Type, resolver: @escaping (ViewControllerContainer) -> Service) {
        let key = String(describing: Service.self)
        self.services[key] = resolver(self)
    }
    
    func resolve<Service>(_ type: Service.Type) -> Service {
        let key = String(describing: type)
        guard let service = services[key] as? Service else {
            fatalError("\(type) service not registered")
        }
        return service
    }
}


// MARK: - 의존성 바인딩
extension ViewControllerContainer {
    func setupBindings() {
        self.bind(service: FruitStore.self) { _ in
            FruitStore()
        }
        
        self.bind(service: JuiceMaker.self) { resolver in
            let fruitStore = resolver.resolve(FruitStore.self)
            return JuiceMaker(fruitStore: fruitStore)
        }
        
        self.bind(service: StockManager.self) { resolver in
            let fruitStore = resolver.resolve(FruitStore.self)
            return StockManager(fruitStore: fruitStore)
        }
        
        self.bind(service: AlertHandler.self) { _ in
            AlertHandler()
        }
        
        self.bind(service: JuiceMachineViewController.self) { resolver in
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(identifier: "JuiceMachineViewController") as! JuiceMachineViewController
            vc.juiceMaker = resolver.resolve(JuiceMaker.self)
            vc.alertDelegate = resolver.resolve(AlertHandler.self)
            return vc
        }

        self.bind(service: StockManageViewController.self) { resolver in
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(identifier: "StockManageViewController") as! StockManageViewController
            vc.stockManager = resolver.resolve(StockManager.self)
            return vc
        }
    }
}
