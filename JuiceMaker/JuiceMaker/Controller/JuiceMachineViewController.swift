
import UIKit

// MARK: - JuiceMachineViewController init & deinit
final class JuiceMachineViewController: UIViewController {
    
    @IBOutlet var juiceMachineView: JuiceMachineView!
    var juiceMaker: JuiceMaker!
    var alertDelegate: PresentationDelegate!
    var coordinator: MainCoordinator!

    deinit { NotificationCenter.default.removeObserver(self) }
}

// MARK: - LifeCycle
extension JuiceMachineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationCenter()
        setupUI()
    }
}

// MARK: - Setup UI
private extension JuiceMachineViewController {
    
    func setupUI() {
        setupButtonAction()
        juiceMaker.updateStock()
    }
    
    func setupButtonAction() {
        juiceMachineView.bananaOrderButton.addTarget(self, action: #selector(bananaJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.strawberryOrderButton.addTarget(self, action: #selector(strawberryJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.mangoOrderButton.addTarget(self, action: #selector(mangoJuiceButtonTapped), for: .touchUpInside)
        juiceMachineView.kiwiOrderButton.addTarget(self, action: #selector(kiwiJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.pineappleOrderButton.addTarget(self, action: #selector(pineappleJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.ddalbaOrderButton.addTarget(self, action: #selector(ddalbaJuiceOrderButtonTapped), for: .touchUpInside)
        juiceMachineView.mangkiOrderButton.addTarget(self, action: #selector(mangkiJuiceButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "재고 수정", style: .plain, target: self, action: #selector(rightBarButtonTapped))
    }
    
}

// MARK: - Button Action Method
private extension JuiceMachineViewController {
    
    @objc func ddalbaJuiceOrderButtonTapped() {
        juiceMaker.makeDdalbaJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "딸바주스 맛있게 드세요")
    }
    
    @objc func mangkiJuiceButtonTapped() {
        juiceMaker.makeMangkiJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "망키주스 맛있게 드세요")
    }
    
    @objc func strawberryJuiceOrderButtonTapped() {
        juiceMaker.makeStrawberryJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "딸기주스 맛있게 드세요")
    }
    
    @objc func bananaJuiceOrderButtonTapped() {
        juiceMaker.makeBananaJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "바나나주스 맛있게 드세요")
    }
    
    @objc func pineappleJuiceOrderButtonTapped() {
        juiceMaker.makePineappleJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "파인애플주스 맛있게 드세요")
    }
    
    @objc func kiwiJuiceOrderButtonTapped() {
        juiceMaker.makeKiwiJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "키위주스 맛있게 드세요")
    }
    
    @objc func mangoJuiceButtonTapped() {
        juiceMaker.makeMangoJuice()
        alertDelegate.presentAelrt(with: .successJuiceOrder, title: "제조 성공", message: "망고주스 맛있게 드세요")
    }
    
    @objc func rightBarButtonTapped() {
        coordinator?.showStockManagement()
    }
}

// MARK: - SetUp Notification Center
private extension JuiceMachineViewController {
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStock), name: .fruitStockDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleError), name: .errorOccured, object: nil)
    }
    
    @objc func updateFruitStock(notification: Notification) {
        guard let fruitStock =
                notification.userInfo?["fruitsStock"] as? [FruitsType: Int] else {
            return
        }
        updateStockLabel(from: fruitStock)
    }
    
    func updateStockLabel(from fruitStock: [FruitsType: Int]) {
        juiceMachineView.bananaStockLabel.text = String(fruitStock[.banana] ?? 0)
        juiceMachineView.strawberryStockLabel.text = String(fruitStock[.strawberry] ?? 0)
        juiceMachineView.mangoStockLabel.text = String(fruitStock[.mango] ?? 0)
        juiceMachineView.pineappleStockLabel.text = String(fruitStock[.pineapple] ?? 0)
        juiceMachineView.kiwiStockLabel.text = String(fruitStock[.kiwi] ?? 0)
    }
    
    @objc func handleError() {
        alertDelegate.presentAlert(
            with: .fruitShortage, title: "재고부족!", message: "재고를 추가하시겠습니까?") { [weak self] _ in
                self?.coordinator?.showStockManagement()
            }
    }
}
