
import UIKit

// MARK: - JuiceMachineViewController init & deinit
final class JuiceMachineViewController: UIViewController {
    
    @IBOutlet var juiceMachineView: JuiceMachineView!
    private let reception = Reception()

    deinit { NotificationCenter.default.removeObserver(self) }
}

// MARK: - LifeCycle
extension JuiceMachineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNotificationCenter()
        setInitialStockLabel()
    }
}

// MARK: - Setup UI
private extension JuiceMachineViewController {
    func setupUI() {
        juiceMachineView.bananaOrderButton.addTarget(self, action: #selector(bananaJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.strawberryOrderButton.addTarget(self, action: #selector(strawberryJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.mangoOrderButton.addTarget(self, action: #selector(mangoJuiceButtonTapped), for: .touchUpInside)
        juiceMachineView.kiwiOrderButton.addTarget(self, action: #selector(kiwiJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.pineappleOrderButton.addTarget(self, action: #selector(pineappleJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.ddalbaOrderButton.addTarget(self, action: #selector(ddalbaJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.mangkiOrderButton.addTarget(self, action: #selector(mangkiJuiceButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Button Action Method
private extension JuiceMachineViewController {

    @objc func ddalbaJuiceOrderButtonTapped() {
        reception.acceptJuiceOrder(juiceType: .ddalba)
    }
    
    @objc func mangkiJuiceButtonTapped() {
        reception.acceptJuiceOrder(juiceType: .mangki)
    }
    
    @objc func strawberryJuiceOrderButtonTapped() {
        reception.acceptJuiceOrder(juiceType: .strawberry)
    }
    
    @objc func bananaJuiceOrderButtonTapped() {
        reception.acceptJuiceOrder(juiceType: .banana)
    }

    @objc func pineappleJuiceOrderButtonTapped() {
        reception.acceptJuiceOrder(juiceType: .pineapple)
    }
    
    @objc func kiwiJuiceOrderButtonTapped() {
        reception.acceptJuiceOrder( juiceType: .kiwi)
    }
    
    @objc func mangoJuiceButtonTapped() {
        reception.acceptJuiceOrder(juiceType: .mango)
    }
}

// MARK: - SetUp Notification Center
private extension JuiceMachineViewController {
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStock), name: .fruitStockDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleStockError), name: .fruitStockLimit, object: nil)
    }
    
    @objc func updateFruitStock(notification: Notification) {
        guard let fruitStock = 
                notification.userInfo?["fruitsStock"] as? [FruitStore.Fruits: Int] else { return }
        updateStockLabel(from: fruitStock)
    }
    
    func updateStockLabel(from fruitStock: [FruitStore.Fruits: Int]) {
        juiceMachineView.bananaStockLabel.text = String(fruitStock[.banana] ?? 0)
        print(String(fruitStock[.banana] ?? 0))
        juiceMachineView.strawberryStockLabel.text = String(fruitStock[.strawberry] ?? 0)
        juiceMachineView.mangoStockLabel.text = String(fruitStock[.mango] ?? 0)
        juiceMachineView.pineappleStockLabel.text = String(fruitStock[.pineapple] ?? 0)
        juiceMachineView.kiwiStockLabel.text = String(fruitStock[.kiwi] ?? 0)
    }
    
    @objc func handleStockError() {
        AlertHandler.shared.presentAlert(of: .fruitShortage("재고부족해요!"))
    }
}

// MARK: - 임시 초기값 설정
extension JuiceMachineViewController {
    func setInitialStockLabel() {
        let fruitStock = reception.fetchInitialFruitsStock()
        updateStockLabel(from: fruitStock)
    }
}
