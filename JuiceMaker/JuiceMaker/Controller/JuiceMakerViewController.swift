//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

class JuiceMakerViewController: UIViewController {
    var juiceMaker = JuiceMaker.shared
    
    @IBOutlet weak var navigationRightButton: UIBarButtonItem!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet weak var orderMangoKiwiButton: UIButton!
    @IBOutlet weak var orderStrawberryJuice: UIButton!
    @IBOutlet weak var orderBananaJuice: UIButton!
    @IBOutlet weak var orderKiwiButton: UIButton!
    @IBOutlet weak var orderMangoButton: UIButton!
    
    @IBOutlet weak var quantityStrawberryJuiceLabel: UILabel!
    @IBOutlet weak var quantityStrawberryBananaJuiceLabel: UILabel!
    @IBOutlet weak var quantityBananaJuiceLabel: UILabel!
    @IBOutlet weak var quantityPineappleJuiceLabel: UILabel!
    @IBOutlet weak var quantityKiwiJuiceLabel: UILabel!
    @IBOutlet weak var quantityMangoKiwiJuiceLabel: UILabel!
    @IBOutlet weak var quantityMangoJuiceLabel: UILabel!
    
    lazy var buttons: [UIButton] = {
        return [
            orderStrawberryBananaJuiceButton,
            orderPineappleJuiceButton,
            orderMangoKiwiButton,
            orderStrawberryJuice,
            orderBananaJuice,
            orderKiwiButton,
            orderMangoButton
        ]
    }()
    
    lazy var labels: [JuiceType: UILabel] = {
       return [
        .strawberryJuice: quantityStrawberryJuiceLabel,
        .strawberryBananaJuice: quantityStrawberryBananaJuiceLabel,
        .bananaJuice: quantityBananaJuiceLabel,
        .pineappleJuice: quantityPineappleJuiceLabel,
        .kiwiJuice: quantityKiwiJuiceLabel,
        .mangoKiwiJuice: quantityMangoKiwiJuiceLabel,
        .mangoJuice: quantityMangoJuiceLabel
       ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let font = UIFont(name: "DungGeunMo", size: 20) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
        }
        setNavigationButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        labels.values.forEach { label in
            label.clipsToBounds = true
            label.layer.cornerRadius = label.bounds.height / 2
        }
        
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    func setNavigationButton() {
        let font = UIFont(name: "DungGeunMo", size: 20)!
        let customButton = UIButton()
        customButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        customButton.setTitle("재고수정", for: .normal)
        customButton.setTitleColor(.blue, for: .normal)
        customButton.setTitleFont(font: font)
        customButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationRightButton.customView = customButton
        customButton.addTarget(self, action: #selector(conectDetailViewController), for: .touchUpInside)
    }
    
    @objc func conectDetailViewController() {
        performSegue(withIdentifier: "DetailView", sender: nil)
    }
    
    private func updateQuantityLabel(juice: JuiceType) {
        let quantity = juiceMaker.showJuiceQuantity(juice: juice)
        if let index = labels.firstIndex(where: { $0.key == juice }) {
            labels[index].value.text = "\(quantity)"
        }
    }
    
    private func showAlert(message: Message) {
        let text = message.description
        let alertController = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func strawberryBananajuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .strawberryBananaJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.strawberryBananaJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .strawberryBananaJuice)
            updateQuantityLabel(juice: .strawberryBananaJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    
    @IBAction func pineapplejuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .pineappleJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.pineappleJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .pineappleJuice)
            updateQuantityLabel(juice: .pineappleJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    @IBAction func mangoKiwijuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .mangoKiwiJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.mangoKiwiJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .mangoKiwiJuice)
            updateQuantityLabel(juice: .mangoKiwiJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    @IBAction func strawberryjuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .strawberryJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.strawberryJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .strawberryJuice)
            updateQuantityLabel(juice: .strawberryJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    @IBAction func bananajuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .bananaJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.bananaJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .bananaJuice)
            updateQuantityLabel(juice: .bananaJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    @IBAction func kiwijuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .kiwiJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.kiwiJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .kiwiJuice)
            updateQuantityLabel(juice: .kiwiJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    @IBAction func mangojuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .mangoJuice) {
            self.showAlert(message: Message.successMakeJuice(juice: JuiceType.mangoJuice.rawValue))
            juiceMaker.addJuiceQuantity(juice: .mangoJuice)
            updateQuantityLabel(juice: .mangoJuice)
        } else {
            self.showAlert(message: Message.failedMakeJuice)
        }
    }
    
}

extension UIButton {
    func setTitleFont(font: UIFont) {
        self.titleLabel?.font = font
    }
}
