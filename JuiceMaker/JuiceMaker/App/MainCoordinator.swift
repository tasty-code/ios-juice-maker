
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let container: ViewControllerContainer

    init(navigationController: UINavigationController, container: ViewControllerContainer) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        let juiceMachineVC = container.resolve(JuiceMachineViewController.self)
        juiceMachineVC.coordinator = self
        navigationController.pushViewController(juiceMachineVC, animated: false)
    }

    func showStockManagement() {
        let stockManageVC = container.resolve(StockManageViewController.self)
        stockManageVC.coordinator = self
        navigationController.pushViewController(stockManageVC, animated: true)
    }
}
