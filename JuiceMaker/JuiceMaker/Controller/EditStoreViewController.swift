//
//  EditStoreViewController.swift
//  JuiceMaker
//
//  Created by YEJI on 2023/09/19.
//

import UIKit

final class EditStoreViewController: UIViewController {
  
  weak var delegate: DismissEditStoreViewDelegate?
  
  private let store = FruitStore.shared
  
  lazy private var strawberryNumber = store.getNum(fruitName: .strawberry)
  lazy private var bananaNumber = store.getNum(fruitName: .banana)
  lazy private var pineappleNumber = store.getNum(fruitName: .pineapple)
  lazy private var kiwiNumber = store.getNum(fruitName: .kiwi)
  lazy private var mangoNumber = store.getNum(fruitName: .mango)
  
  @IBOutlet weak private var strawberryNumberLabel: UILabel!
  @IBOutlet weak private var bananaNumberLabel: UILabel!
  @IBOutlet weak private var pineappleNumberLabel: UILabel!
  @IBOutlet weak private var kiwiNumberLabel: UILabel!
  @IBOutlet weak private var mangoNumberLabel: UILabel!
  
  @IBOutlet weak private var strawberryStepper: UIStepper!
  @IBOutlet weak private var bananaStepper: UIStepper!
  @IBOutlet weak private var pineappleStepper: UIStepper!
  @IBOutlet weak private var kiwiStepper: UIStepper!
  @IBOutlet weak private var mangoStepper: UIStepper!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNumberLabel()
    setMinimumValue()
  }
  
  private func setNumberLabel() {
    strawberryNumberLabel.text = strawberryNumber.description
    bananaNumberLabel.text = bananaNumber.description
    pineappleNumberLabel.text = pineappleNumber.description
    kiwiNumberLabel.text = kiwiNumber.description
    mangoNumberLabel.text = mangoNumber.description
  }
  
  private func setMinimumValue() {
    let fruitStepperList: [UILabel: UIStepper] = [strawberryNumberLabel: strawberryStepper, bananaNumberLabel: bananaStepper, pineappleNumberLabel: pineappleStepper, kiwiNumberLabel: kiwiStepper, mangoNumberLabel: mangoStepper]
    
    for (fruitLabel, fruitStepper) in fruitStepperList {
      guard let stringFruitValue = fruitLabel.text else { return }
      guard let doubleFruitValue = Double(stringFruitValue) else { return }
      fruitStepper.minimumValue = -doubleFruitValue
    }
  }
  
  @IBAction private func dismissButtonTapped(_ sender: UIButton) {
    self.delegate?.updateData()
    self.dismiss(animated: true)
  }
  
  @IBAction private func stepperButtonTapped(_ sender: UIStepper) {
    switch sender.tag {
    case 0:
      let changeNumber = getChangeNumber(fruitNumber: strawberryNumber, changeValue: sender.value)
      strawberryNumberLabel.text = changeNumber.description
      store.update(fruitName: .strawberry, number: changeNumber)
    case 1:
      let changeNumber = getChangeNumber(fruitNumber: bananaNumber, changeValue: sender.value)
      bananaNumberLabel.text = changeNumber.description
      store.update(fruitName: .banana, number: changeNumber)
    case 2:
      let changeNumber = getChangeNumber(fruitNumber: pineappleNumber, changeValue: sender.value)
      pineappleNumberLabel.text = changeNumber.description
      store.update(fruitName: .pineapple, number: changeNumber)
    case 3:
      let changeNumber = getChangeNumber(fruitNumber: kiwiNumber, changeValue: sender.value)
      kiwiNumberLabel.text = changeNumber.description
      store.update(fruitName: .kiwi, number: changeNumber)
    case 4:
      let changeNumber = getChangeNumber(fruitNumber: mangoNumber, changeValue: sender.value)
      mangoNumberLabel.text = changeNumber.description
      store.update(fruitName: .mango, number: changeNumber)
    default:
      return
    }
  }
  
  private func getChangeNumber(fruitNumber: Int, changeValue: Double) -> Int {
    return fruitNumber + Int(changeValue)
  }
}
