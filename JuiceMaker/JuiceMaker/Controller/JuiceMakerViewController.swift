//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

final class JuiceMakerViewController: UIViewController {
    @IBOutlet weak var navigationRightButton: UIBarButtonItem!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderPineappleJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderMangoKiwiJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderStrawberryJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderBananaJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderKiwiJuiceButton: JuiceMakerButton!
    @IBOutlet weak var orderMangoJuiceButton: JuiceMakerButton!
    
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
        
        setupBackgroundGradientButton()
        setNavigationButton()
    }
    
    private func setupBackgroundGradientButton() {
        self.orderBananaJuiceButton.addGradient(colors: [.bananaColor])
        self.orderStrawberryJuiceButton.addGradient(colors: [.strawberryColor])
        self.orderPineappleJuiceButton.addGradient(colors: [.pineappleColor])
        self.orderKiwiJuiceButton.addGradient(colors: [.kiwiColor])
        self.orderMangoJuiceButton.addGradient(colors: [.mangoColor])
        self.orderMangoKiwiJuiceButton.addGradient(colors: [.mangoColor, .kiwiColor])
        self.orderStrawberryBananaJuiceButton.addGradient(colors: [.strawberryColor, .bananaColor])
    }
    
    private func setNavigationButton() {
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
    
    @objc
    private func conectDetailViewController() {
        performSegue(withIdentifier: "DetailView", sender: nil)
    }
    
    @IBAction private func juiceButtonTapped(_ sender: UIButton) {
        let selectTag = Int(sender.tag)
        let result = Juice.allCases[selectTag]
        makeJuiceProcess(juice: result)
    }

    private func makeJuiceProcess(juice: Juice) {
        JuiceMaker.shared.makeJuice(juice: juice) ? JuiceProcess(input: juice) : makeFailedAlert(title: Message.failedMakeJuiceTitle.description, message: Message.failedMakeJuice.description, okAction: { _ in
            self.editAction()
        })
    }

    private func JuiceProcess(input: Juice) {
            JuiceMaker.shared.addJuiceQuantity(juice: input)
            updateQuantityLabel(juice: input)
        makeCompletedAlert(title: Message.successMakeJuiceTitle.description, message: String(Message.successMakeJuice(juice: input.rawValue).description))
    }
    
    private func updateQuantityLabel(juice: Juice) {
        let labels: [Juice: UILabel] = {
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
        let quantity = JuiceMaker.shared.showJuiceQuantity(juice: juice)
        if let index = labels.firstIndex(where: { $0.key == juice }) {
            labels[index].value.text = "\(quantity)"
        }
    }
    
    private func editAction() {
        guard let controller = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


extension UIButton {
    public func setTitleFont(font: UIFont) {
        self.titleLabel?.font = font
    }
}
