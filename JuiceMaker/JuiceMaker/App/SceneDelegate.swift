
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var mainCoordinator: MainCoordinator?
    let container = ViewControllerContainer.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        container.setupBindings()

        let navigationController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController: navigationController, container: container)
        mainCoordinator?.start()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
