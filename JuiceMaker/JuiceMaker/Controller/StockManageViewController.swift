
import UIKit

// MARK: - StockManageViewController init & deinit
class StockManageViewController: UIViewController {
    @IBOutlet var stockManageView: StockManageView!
    var reception: Reception?
}

// MARK: - StockManageViewController LifeCycle
extension StockManageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationCenter()
        reception?.applyCurrentStocks()
    }
}

// MARK: - SetUp Notification Center
private extension StockManageViewController {
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStock), name: .fruitStockDidChange, object: nil)
    }
    
    @objc func updateFruitStock(notification: Notification) {
        guard let fruitStock =
            notification.userInfo?["fruitsStock"] as? [FruitStore.Fruits: Int] else {
            ErrorType.notificationCenterError("\(#function)에서 문제가 생겼습니다!").printMessage()
            return
        }
        updateStockLabel(from: fruitStock)
    }
    
    func updateStockLabel(from fruitStock: [FruitStore.Fruits: Int]) {
        stockManageView.bananaStockLabel.text = String(fruitStock[.banana] ?? 0)
        stockManageView.strawberryStockLabel.text = String(fruitStock[.strawberry] ?? 0)
        stockManageView.mangoStockLabel.text = String(fruitStock[.mango] ?? 0)
        stockManageView.pineappleStockLabel.text = String(fruitStock[.pineapple] ?? 0)
        stockManageView.kiwiStockLabel.text = String(fruitStock[.kiwi] ?? 0)
    }
}




