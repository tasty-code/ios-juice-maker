
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    fileprivate let limitedQuantity = 0
    fileprivate let initialQunatities = 10
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let fruitStore = FruitStore(limitedQuantity: limitedQuantity, initialQunatities: initialQunatities)
        let alertHandler = AlertHandler()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let juiceMachineViewController = storyboard.instantiateViewController(identifier: "JuiceMachineViewController") as? JuiceMachineViewController else {return}
        guard let stockManageViewController = storyboard.instantiateViewController(identifier: "StockManageViewController") as? StockManageViewController else {return}
        
        var juiceMaker = JuiceMaker()
        var stockManager = StockManager()
        
        juiceMaker.fruitStore = fruitStore
        stockManager.fruitStore = fruitStore
        
        juiceMachineViewController.juiceMaker = juiceMaker
        stockManageViewController.stockManager = stockManager
        
        juiceMachineViewController.alertDelegate = alertHandler
        
        let navigationViewController = UINavigationController(rootViewController: juiceMachineViewController)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        juiceMachineViewController.onPushStockManageViewController = {
            juiceMachineViewController.navigationController?.pushViewController(stockManageViewController, animated: true)
        }
    }
}




