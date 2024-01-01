
import Foundation

final class Container {
    static let shared = Container()
    
    private init() {}
    
    private var services: [String: Any] = [:]
    
    func bind<Service>(service: Service.Type, resolver: @escaping (Container) -> Service) {
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
    }
}
