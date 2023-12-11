
import UIKit

// MARK: - JuiceMachineViewController 초기화
final class JuiceMachineViewController: UIViewController {
    
    @IBOutlet var juiceMachineView: JuiceMachineView!
    
    private let reception = Reception()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getFruitsStock()
        setupNotificationCenter()
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
        NotificationCenter.default.addObserver(self, selector: #selector(getFruitsStock), name: .fruitStockDidChange, object: nil)
    }
    
    @objc func getFruitsStock() {
        juiceMachineView.bananaStockLabel.text = String(reception.getFruitsStock(fruit: .banana))
        juiceMachineView.strawberryStockLabel.text = String(reception.getFruitsStock(fruit: .strawberry))
        juiceMachineView.mangoStockLabel.text = String(reception.getFruitsStock(fruit: .mango))
        juiceMachineView.pineappleStockLabel.text = String(reception.getFruitsStock(fruit: .pineapple))
        juiceMachineView.kiwiStockLabel.text = String(reception.getFruitsStock(fruit: .kiwi))
    }
}
