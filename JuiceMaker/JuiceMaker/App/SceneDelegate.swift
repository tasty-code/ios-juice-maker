
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let container = Container.shared
        container.setupBindings()

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






