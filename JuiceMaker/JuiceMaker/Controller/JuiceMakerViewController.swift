//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

final class JuiceMakerViewController: UIViewController {
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
    
    @IBOutlet weak var toolbarRightButton: UIButton!
    @IBOutlet weak var toolbarTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbarTitleLabel()
        configureBackgroundGradientButton()
        configureToolbarRightButton()
    }
    
    
    private func configureToolbarTitleLabel() {
        do {
            let font = try UIFont(name: JuiceMakerViewText.fontTitleText.description, size: 20)
            toolbarTitleLabel.text = JuiceMakerViewText.mainTitleText.description
            toolbarTitleLabel.textColor = .black
            toolbarTitleLabel.font = font
        } catch {
            print(JuiceMakerError.notFoundFont.description)
        }
    }
    
    private func configureBackgroundGradientButton() {
        self.orderBananaJuiceButton.configureUIGradient(colors: [.bananaColor])
        self.orderStrawberryJuiceButton.configureUIGradient(colors: [.strawberryColor])
        self.orderPineappleJuiceButton.configureUIGradient(colors: [.pineappleColor])
        self.orderKiwiJuiceButton.configureUIGradient(colors: [.kiwiColor])
        self.orderMangoJuiceButton.configureUIGradient(colors: [.mangoColor])
        self.orderMangoKiwiJuiceButton.configureUIGradient(colors: [.mangoColor, .kiwiColor])
        self.orderStrawberryBananaJuiceButton.configureUIGradient(colors: [.strawberryColor, .bananaColor])
    }
    
    private func configureToolbarRightButton() {
        do {
            let font = try UIFont(name: JuiceMakerViewText.fontTitleText.description, size: 20)
            toolbarRightButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
            toolbarRightButton.setTitle(JuiceMakerViewText.editQuantityButtonTitleText.description, for: .normal)
            toolbarRightButton.setTitleColor(.blue, for: .normal)
            toolbarRightButton.setTitleFont(font: font)
            toolbarRightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            toolbarRightButton.addTarget(self, action: #selector(showDetailView), for: .touchUpInside)
        } catch {
            print(JuiceMakerError.notFoundFont.description)
        }
        
    }
  
    @IBAction private func juiceButtonTapped(_ sender: UIButton) {
        let selectTag = Int(sender.tag)
        let result = Juice.allCases[selectTag]
        JuiceMaker.shared.isJuiceAvailable(juice: result) ? successMakeJuice(input: result) : failedAlert(title: Message.failedMakeJuiceTitle.description, message: Message.failedMakeJuice.description, okAction: { [unowned self] _ in
                self.showDetailView()
            })
    }
    
    private func successMakeJuice(input: Juice) {
        setupQuantityLabel(juice: input)
        completedAlert(title: Message.successMakeJuiceTitle.description, message: String(Message.successMakeJuice(juice: input.rawValue).description))
    }
    
    private func setupQuantityLabel(juice: Juice) {
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
    
    @objc
    private func showDetailView() {
        guard let controller = self.storyboard?.instantiateViewController(identifier: JuiceMakerViewText.detailViewControllerText.description) as? DetailViewController else {
            return
        }
        
        self.present(controller, animated: true)
    }
}
