//
//  EditStoreViewController.swift
//  JuiceMaker
//
//  Created by YEJI on 2023/09/19.
//

import UIKit

final class EditStoreViewController: UIViewController {
  
  var delegate: DismissEditStoreViewDelegate?
  
  var strawberryValue: String?
  var bananaValue: String?
  var pineappleValue: String?
  var kiwiValue: String?
  var mangoValue: String?
  
  private let store = FruitStore.shared
  
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
    strawberryNumberLabel.text = strawberryValue
    bananaNumberLabel.text = bananaValue
    pineappleNumberLabel.text = pineappleValue
    kiwiNumberLabel.text = kiwiValue
    mangoNumberLabel.text = mangoValue
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
      let changeNumber = getChangeNumber(fruitNumber: strawberryValue, changeValue: sender.value)
      strawberryNumberLabel.text = changeNumber.description
      store.update(fruitName: .strawberry, number: changeNumber)
    case 1:
      let changeNumber = getChangeNumber(fruitNumber: bananaValue, changeValue: sender.value)
      bananaNumberLabel.text = changeNumber.description
      store.update(fruitName: .banana, number: changeNumber)
    case 2:
      let changeNumber = getChangeNumber(fruitNumber: pineappleValue, changeValue: sender.value)
      pineappleNumberLabel.text = changeNumber.description
      store.update(fruitName: .pineapple, number: changeNumber)
    case 3:
      let changeNumber = getChangeNumber(fruitNumber: kiwiValue, changeValue: sender.value)
      kiwiNumberLabel.text = changeNumber.description
      store.update(fruitName: .kiwi, number: changeNumber)
    case 4:
      let changeNumber = getChangeNumber(fruitNumber: mangoValue, changeValue: sender.value)
      mangoNumberLabel.text = changeNumber.description
      store.update(fruitName: .mango, number: changeNumber)
    default:
      return
    }
  }
  
  private func getChangeNumber(fruitNumber: String?, changeValue: Double) -> Int {
    guard let stringFruitValue = fruitNumber else { return 0 }
    guard let intFruitValue = Int(stringFruitValue) else { return 0 }
    return intFruitValue + Int(changeValue)
  }
}
