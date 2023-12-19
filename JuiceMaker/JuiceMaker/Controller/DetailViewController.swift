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
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var toolbarRightButton: UIButton!
    @IBOutlet weak var toolbarTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetToButton()
        setupLabel()
        setupFruitStepperValues()
        configUIToolbarRightButton()
        configUIToolbarTitleLabel()
    }
    
    private func addTargetToButton() {
        strawberryStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        bananaStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        pineappleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        kiwiStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        mangoStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    @objc
    private func stepperValueChanged(_ sender: UIStepper) {
        let selectTag = Int(sender.tag)
        let result = Fruit.allCases[selectTag]
        FruitStore.shared.updateFruitQuantity(fruit: result, result: Int(sender.value))
        setupLabel()
    }
    
    private func setupLabel() {
        quantityStrawberryLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.strawberry)
        quantityBananaLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.banana)
        quantityPineappleLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.pineapple)
        quantityKiwiLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.kiwi)
        quantityMangoLabel.text = FruitStore.shared.showFruitQuantity(fruit: Fruit.mango)
    }
    
    private func setupFruitStepperValues() {
        strawberryStepper.value = Double(FruitStore.shared.fruitList[0].quantity)
        bananaStepper.value = Double(FruitStore.shared.fruitList[1].quantity)
        pineappleStepper.value = Double(FruitStore.shared.fruitList[2].quantity)
        kiwiStepper.value = Double(FruitStore.shared.fruitList[3].quantity)
        mangoStepper.value = Double(FruitStore.shared.fruitList[4].quantity)
    }
    
    private func configUIToolbarRightButton() {
        let font = UIFont(name: MainViewText.fontText.description, size: 20)!
        toolbarRightButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        toolbarRightButton.setTitle(MainViewText.closeText.description, for: .normal)
        toolbarRightButton.setTitleColor(.blue, for: .normal)
        toolbarRightButton.setTitleFont(font: font)
        toolbarRightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        toolbarRightButton.addTarget(self, action: #selector(dismissDetailView), for: .touchUpInside)
    }
    
    private func configUIToolbarTitleLabel() {
        let font = UIFont(name: MainViewText.fontText.description, size: 20)!
        toolbarTitleLabel.text = MainViewText.detailViewText.description
        toolbarTitleLabel.textColor = .black
        toolbarTitleLabel.font = font
    }
    
    @objc
    private func dismissDetailView() {
        self.dismiss(animated: true)
    }
    
}
