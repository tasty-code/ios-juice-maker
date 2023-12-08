
import UIKit

// MARK: - JuiceMachineViewController 초기화
class JuiceMachineViewController: UIViewController {
    
    private let juiceMachineView = JuiceMachineView()
    private let reception = Reception()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Button Action Method
    @IBAction func ddalbaJuiceOrderButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .ddalba)
    }
    
    @IBAction func mangkiJuiceButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .mangki)
    }
    
    @IBAction func strawberryJuiceOrderButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .strawberry)
    }
    
    @IBAction func bananaJuiceOrderButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .banana)
    }
    
    @IBAction func pineappleJuiceOrderButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .pineapple)
    }
    
    @IBAction func kiwiJuiceOrderButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .kiwi)
    }
    
    @IBAction func mangoJuiceButtonTapped(_ sender: UIButton) {
        reception.acceptOrder(request: .juiceOrder, juiceType: .mango)
    }
}
