//
//  EditStoreViewController.swift
//  JuiceMaker
//
//  Created by YEJI on 2023/09/19.
//

import UIKit

class EditStoreViewController: UIViewController {
  
  var delegate: UpdateProtocol?
  let store = FruitStore.shared
  
  var strawberry: String?
  var banana: String?
  var pineapple: String?
  var kiwi: String?
  var mango: String?
  
  @IBOutlet weak var strawberryNumberLabel: UILabel!
  @IBOutlet weak var bananaNumberLabel: UILabel!
  @IBOutlet weak var pineappleNumberLabel: UILabel!
  @IBOutlet weak var kiwiNumberLabel: UILabel!
  @IBOutlet weak var mangoNumberLabel: UILabel!
  
  @IBOutlet weak var strawberryStepper: UIStepper!
  @IBOutlet weak var bananaStepper: UIStepper!
  @IBOutlet weak var pineappleStepper: UIStepper!
  @IBOutlet weak var kiwiStepper: UIStepper!
  @IBOutlet weak var mangoStepper: UIStepper!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNumberLabel()
    setMinimumValue()
  }
  
  func setNumberLabel() {
    strawberryNumberLabel.text = strawberry
    bananaNumberLabel.text = banana
    pineappleNumberLabel.text = pineapple
    kiwiNumberLabel.text = kiwi
    mangoNumberLabel.text = mango
  }
  
  @IBAction func dismissButtonTapped(_ sender: UIButton) {
    self.delegate?.update()
    self.dismiss(animated: true)
  }
  
  @IBAction func stepperButtonTapped(_ sender: UIStepper) {
    let tag = sender.tag
    switch tag {
    case 0:
      let changeNumber = getChangeNumber(fruitNumber: strawberry, changeValue: sender.value)
      strawberryNumberLabel.text = changeNumber.description
      store.update(fruitName: .strawberry, number: changeNumber)
    case 1:
      let changeNumber = getChangeNumber(fruitNumber: banana, changeValue: sender.value)
      bananaNumberLabel.text = changeNumber.description
      store.update(fruitName: .banana, number: changeNumber)
    case 2:
      let changeNumber = getChangeNumber(fruitNumber: pineapple, changeValue: sender.value)
      pineappleNumberLabel.text = changeNumber.description
      store.update(fruitName: .pineapple, number: changeNumber)
    case 3:
      let changeNumber = getChangeNumber(fruitNumber: kiwi, changeValue: sender.value)
      kiwiNumberLabel.text = changeNumber.description
      store.update(fruitName: .kiwi, number: changeNumber)
    case 4:
      let changeNumber = getChangeNumber(fruitNumber: mango, changeValue: sender.value)
      mangoNumberLabel.text = changeNumber.description
      store.update(fruitName: .mango, number: changeNumber)
    default:
      return
    }
  }
  
  func getChangeNumber(fruitNumber: String?, changeValue: Double) -> Int {
    guard let fruitString = fruitNumber else { return 0 }
    guard let fruitNumber = Int(fruitString) else { return 0 }
    return fruitNumber + Int(changeValue)
  }
  
  func setMinimumValue() {
    let fruitStepperList: [UILabel: UIStepper] = [strawberryNumberLabel: strawberryStepper, bananaNumberLabel: bananaStepper, pineappleNumberLabel: pineappleStepper, kiwiNumberLabel: kiwiStepper, mangoNumberLabel: mangoStepper]
    
    for (fruitLabel, fruitStepper) in fruitStepperList {
      guard let fruitString = fruitLabel.text else { return }
      guard let fruitdouble = Double(fruitString) else { return }
      fruitStepper.minimumValue = -fruitdouble
    }
  }
}
