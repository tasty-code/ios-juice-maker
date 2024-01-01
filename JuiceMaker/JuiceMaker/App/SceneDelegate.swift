
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let container = ViewControllerContainer.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        container.setupBindings()

        let juiceMachineVC = container.resolve(JuiceMachineViewController.self)
        let stockManageVC = container.resolve(StockManageViewController.self)

        let navigationVC = UINavigationController(rootViewController: juiceMachineVC)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()

        juiceMachineVC.onPushStockManageViewController = {
            juiceMachineVC.navigationController?.pushViewController(stockManageVC, animated: true)
        }
    }
}
