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
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderPineappleJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderMangoKiwiButton: JuiceMakerButton!
    @IBOutlet weak var orderStrawberryJuice: JuiceMakerButton!
    @IBOutlet weak var orderBananaJuice: JuiceMakerButton!
    @IBOutlet weak var orderKiwiButton: JuiceMakerButton!
    @IBOutlet weak var orderMangoButton: JuiceMakerButton!
    
    @IBOutlet weak var quantityStrawberryJuiceLabel: JuiceMakerLabel!
    @IBOutlet weak var quantityStrawberryBananaJuiceLabel: JuiceMakerLabel!
    @IBOutlet weak var quantityBananaJuiceLabel: JuiceMakerLabel!
    @IBOutlet weak var quantityPineappleJuiceLabel: JuiceMakerLabel!
    @IBOutlet weak var quantityKiwiJuiceLabel: JuiceMakerLabel!
    @IBOutlet weak var quantityMangoKiwiJuiceLabel: JuiceMakerLabel!
    @IBOutlet weak var quantityMangoJuiceLabel: JuiceMakerLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let font = UIFont(name: "DungGeunMo", size: 20) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
        }
        setNavigationButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUIButton()
    }
    
    func setupUIButton() {
        self.orderBananaJuice.addGradient(colors: [.bananaColor])
        self.orderStrawberryJuice.addGradient(colors: [.strawberryColor])
        self.orderPineappleJuiceButton.addGradient(colors: [.pineappleColor])
        self.orderKiwiButton.addGradient(colors: [.kiwiColor])
        self.orderMangoButton.addGradient(colors: [.mangoColor])
        self.orderMangoKiwiButton.addGradient(colors: [.mangoColor, .kiwiColor])
        self.orderStrawberryBananaJuiceButton.addGradient(colors: [.strawberryColor, .bananaColor])
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
        let labels: [JuiceType: UILabel] = {
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
            //            self.showAlert(message: Message.failedMakeJuice)
            makeFailedAlert(title: "제작실패", message: Message.failedMakeJuice.description, okAction: { _ in
                self.editAction()
            })
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
    
    func editAction() {
        guard let controller = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            return
        }
    
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}


extension UIButton {
    func setTitleFont(font: UIFont) {
        self.titleLabel?.font = font
    }
}
