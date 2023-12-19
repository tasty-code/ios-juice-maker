
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
        setupUI()
    }
}

// MARK: - Setup UI
private extension StockManageViewController {
    
    func setupUI() {
        setupButtonAction()
        reception?.applyCurrentStocks()
    }
    
    func setupButtonAction() {
        stockManageView.strawberryStockStepper.addTarget(self, action: #selector(strawberryStockStepperTapped), for: .touchUpInside)
        stockManageView.bananaStockStepper.addTarget(self, action: #selector(bananaStockStepperTapped), for: .touchUpInside)
        stockManageView.pineappleStockStepper.addTarget(self, action: #selector(pineappleStockStepperTapped), for: .touchUpInside)
        stockManageView.kiwiStockStepper.addTarget(self, action: #selector(kiwiStockStepperTapped), for: .touchUpInside)
        stockManageView.mangoStockStepper.addTarget(self, action: #selector(mangoStockStepperTapped), for: .touchUpInside)
    }
}

// MARK: - Button Action Method
private extension StockManageViewController {
    
    @objc func strawberryStockStepperTapped(_ sender: UIStepper) {
        reception?.applyChangedStocks(of: .strawberry, to: Int(sender.value))
    }
    
    @objc func bananaStockStepperTapped(_ sender: UIStepper) {
        reception?.applyChangedStocks(of: .banana, to: Int(sender.value))
    }
    
    @objc func pineappleStockStepperTapped(_ sender: UIStepper) {
        reception?.applyChangedStocks(of: .pineapple, to: Int(sender.value))
    }
    
    @objc func kiwiStockStepperTapped(_ sender: UIStepper) {
        reception?.applyChangedStocks(of: .kiwi, to: Int(sender.value))
    }
    
    @objc func mangoStockStepperTapped(_ sender: UIStepper) {
        reception?.applyChangedStocks(of: .mango, to: Int(sender.value))
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
            return
        }
        updateStockLabel(from: fruitStock)
        setUpInitialStepperValue(from: fruitStock)
    }
    
    func updateStockLabel(from fruitStock: [FruitStore.Fruits: Int]) {
        stockManageView.bananaStockLabel.text = String(fruitStock[.banana] ?? 0)
        stockManageView.strawberryStockLabel.text = String(fruitStock[.strawberry] ?? 0)
        stockManageView.mangoStockLabel.text = String(fruitStock[.mango] ?? 0)
        stockManageView.pineappleStockLabel.text = String(fruitStock[.pineapple] ?? 0)
        stockManageView.kiwiStockLabel.text = String(fruitStock[.kiwi] ?? 0)
    }
    
    func setUpInitialStepperValue(from fruitStock: [FruitStore.Fruits: Int]) {
        stockManageView.strawberryStockStepper.value = Double(fruitStock[.strawberry] ?? 0)
        stockManageView.bananaStockStepper.value = Double(fruitStock[.banana] ?? 0)
        stockManageView.mangoStockStepper.value = Double(fruitStock[.mango] ?? 0)
        stockManageView.pineappleStockStepper.value = Double(fruitStock[.pineapple] ?? 0)
        stockManageView.kiwiStockStepper.value = Double(fruitStock[.kiwi] ?? 0)
    }
}




