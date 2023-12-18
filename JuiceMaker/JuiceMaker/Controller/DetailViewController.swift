//
//  DetailViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var quantityStrawberryLabel: UILabel!
    @IBOutlet weak var quantityBananaLabel: UILabel!
    @IBOutlet weak var quantityPineappleLabel: UILabel!
    @IBOutlet weak var quantityKiwiLabel: UILabel!
    @IBOutlet weak var quantityMangoLabel: UILabel!
    
    @IBOutlet weak var remoteStrawberryButton: UIStepper!
    @IBOutlet weak var remoteBananaButton: UIStepper!
    @IBOutlet weak var remotePineappleButton: UIStepper!
    @IBOutlet weak var remoteKiwiButton: UIStepper!
    @IBOutlet weak var remotemangoButton: UIStepper!
    
    @IBOutlet weak var toolbarRightButton: UIButton!

    @IBOutlet weak var toolbarTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        addActionButton()
        setupRemoteButtonValsue()
        configUIToolbarRightButton()
        configUIToolbarTitleLabel()
    }
    
    private func configUIToolbarTitleLabel() {
        let font = UIFont(name: "DungGeunMo", size: 20)!
        toolbarTitleLabel.text = "재고확인"
        toolbarTitleLabel.textColor = .black
        toolbarTitleLabel.font = font
    }
    
    private func configUIToolbarRightButton() {
        let font = UIFont(name: "DungGeunMo", size: 20)!
        toolbarRightButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        toolbarRightButton.setTitle("닫기", for: .normal)
        toolbarRightButton.setTitleColor(.blue, for: .normal)
        toolbarRightButton.setTitleFont(font: font)
        toolbarRightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        toolbarRightButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }
    
    private func setupLabel() {
        quantityStrawberryLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.strawberry)
        quantityBananaLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.banana)
        quantityPineappleLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.pineapple)
        quantityKiwiLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.kiwi)
        quantityMangoLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.mango)
    }
    
    private func addActionButton() {
        remoteStrawberryButton.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        remoteBananaButton.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        remotePineappleButton.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        remoteKiwiButton.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        remotemangoButton.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    private func setupRemoteButtonValsue() {
        remoteStrawberryButton.value = Double(FruitStore.shared.fruitList[0].quantity)
        remoteBananaButton.value = Double(FruitStore.shared.fruitList[1].quantity)
        remotePineappleButton.value = Double(FruitStore.shared.fruitList[2].quantity)
        remoteKiwiButton.value = Double(FruitStore.shared.fruitList[3].quantity)
        remotemangoButton.value = Double(FruitStore.shared.fruitList[4].quantity)
    }
    
    @objc
    private func stepperValueChanged(_ sender: UIStepper) {
        let selectTag = Int(sender.tag)
        let result = Fruit.allCases[selectTag]
        FruitStore.shared.updateFruitQuantity(fruit: result, result: Int(sender.value))
        setupLabel()
    }
    
    @objc
    private func dismissController() {
        self.dismiss(animated: true)
    }
    
}
