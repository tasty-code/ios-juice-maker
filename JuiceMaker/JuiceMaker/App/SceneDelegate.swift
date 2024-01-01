
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let container = Container.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        setupBindings()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let juiceMachineVC = storyboard.instantiateViewController(identifier: "JuiceMachineViewController") as? JuiceMachineViewController else { return }
        guard let stockManageVC = storyboard.instantiateViewController(identifier: "StockManageViewController") as? StockManageViewController else { return }
        
        juiceMachineVC.juiceMaker = container.resolve(JuiceMaker.self)
        juiceMachineVC.alertDelegate = container.resolve(AlertHandler.self)
        stockManageVC.stockManager = container.resolve(StockManager.self)

        let navigationVC = UINavigationController(rootViewController: juiceMachineVC)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()

        juiceMachineVC.onPushStockManageViewController = {
            juiceMachineVC.navigationController?.pushViewController(stockManageVC, animated: true)
        }
    }
}


// MARK: - 의존성 바인딩
extension SceneDelegate {
    func setupBindings() {
        self.container.bind(service: FruitStore.self) { _ in
            FruitStore()
        }
        
        container.bind(service: JuiceMaker.self) { resolver in
            let fruitStore = resolver.resolve(FruitStore.self)
            return JuiceMaker(fruitStore: fruitStore)
        }

        container.bind(service: StockManager.self) { resolver in
            let fruitStore = resolver.resolve(FruitStore.self)
            return StockManager(fruitStore: fruitStore)
        }

        container.bind(service: AlertHandler.self) { _ in
            AlertHandler()
        }
    }
}
