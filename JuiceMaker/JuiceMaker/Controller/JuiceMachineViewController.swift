
import UIKit

// MARK: - JuiceMachineViewController 초기화
class JuiceMachineViewController: UIViewController {
    
    @IBOutlet var juiceMachineView: JuiceMachineView!
    
    private let reception = Reception()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Setup UI
extension JuiceMachineViewController {
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
extension JuiceMachineViewController {

    @objc func ddalbaJuiceOrderButtonTapped() {
        reception.acceptOrder(request: .juiceOrder, juiceType: .ddalba)
    }
    
    @objc func mangkiJuiceButtonTapped() {
        reception.acceptOrder(request: .juiceOrder, juiceType: .mangki)
    }
    
    @objc func strawberryJuiceOrderButtonTapped() {
        reception.acceptOrder(request: .juiceOrder, juiceType: .strawberry)
    }
    
    @objc func bananaJuiceOrderButtonTapped() {
    reception.acceptOrder(request: .juiceOrder, juiceType: .banana)
    }

    @objc func pineappleJuiceOrderButtonTapped() {
        reception.acceptOrder(request: .juiceOrder, juiceType: .pineapple)
    }
    
    @objc func kiwiJuiceOrderButtonTapped() {
        reception.acceptOrder(request: .juiceOrder, juiceType: .kiwi)
    }
    
    @objc func mangoJuiceButtonTapped() {
        reception.acceptOrder(request: .juiceOrder, juiceType: .mango)
    }
}
