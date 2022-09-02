//
//  MakeJuiceController.swift
//  JuiceMaker
//
//  Created by 정연호 on 2022/08/31.
//

import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    var fruitsObserver: () -> Void = {   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateAllFluitLabel()
        fruitsObserver = juiceMaker.fruitsObserve(at: fruitsObserve)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fruitsObserver()
    }
    
    @IBAction func tapStrawberryBananaJuiceButton(_ sender: Any) {
        self.makeJuice(of: .strawberryBanana)
    }
    
    @IBAction func tapMangoKiwiJuice(_ sender: Any) {
        self.makeJuice(of: .mangoKiwi)
    }
    
    @IBAction func tapStrawberryJuiceButton(_ sender: Any) {
        self.makeJuice(of: .strawberry)
    }
    
    @IBAction func tapBananaJuiceButton(_ sender: Any) {
        self.makeJuice(of: .banana)
    }
    
    @IBAction func tapPineappleJuiceButton(_ sender: Any) {
        self.makeJuice(of: .pineapple)
    }
    
    @IBAction func tapKiwiJuiceButton(_ sender: Any) {
        self.makeJuice(of: .kiwi)
    }
    
    @IBAction func tapMangoJuiceButton(_ sender: Any) {
        self.makeJuice(of: .mango)
    }
    
    @IBAction func tapFruitManagementButton(_ sender: Any) {
        self.pushFruitManagement()
    }
    
    func showAlert(message: String, confirmText: String, confirmHandler: ((UIAlertAction) -> Void)? = nil, cancelText: String = "") {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: confirmText, style: .default, handler: confirmHandler)
        let cancel = UIAlertAction(title: cancelText, style: .cancel)
        
        alert.addAction(confirm)
        if (cancelText != "") {
            alert.addAction(cancel)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func makeJuice(of juice: Juice) {
        let juiceStatus = juiceMaker.makeJuice(of: juice)
        
        if juiceStatus.status == .lackOfFruit {
            showAlert(message: juiceStatus.message, confirmText: JuiceMakerViewControllerText.yes, confirmHandler: { _ in self.pushFruitManagement() }, cancelText: JuiceMakerViewControllerText.no)
        } else {
            showAlert(message: juiceStatus.message, confirmText: JuiceMakerViewControllerText.confirm)
        }
    }
    
    func pushFruitManagement() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fruitManagementVC = storyboard.instantiateViewController(identifier: "FruitManagement") as FruitManagementViewController
        
        fruitManagementVC.juiceMaker = juiceMaker
    
        navigationController?.pushViewController(fruitManagementVC, animated: true)
    }
    
    func fruitsObserve(_ fruits: [Fruit: Int]) {
        updateAllFluitLabel()
    }

    func updateAllFluitLabel() {
        strawberryLabel.text = String((try? juiceMaker.getQuantity(of: .strawberry)) ?? 0)
        bananaLabel.text = String((try? juiceMaker.getQuantity(of: .banana)) ?? 0)
        pineappleLabel.text = String((try? juiceMaker.getQuantity(of: .pineapple)) ?? 0)
        kiwiLabel.text = String((try? juiceMaker.getQuantity(of: .kiwi)) ?? 0)
        mangoLabel.text = String((try? juiceMaker.getQuantity(of: .mango)) ?? 0)
    }
}
