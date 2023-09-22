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
      let changeNumber = getChangeNumber(fruitName: strawberry, changeValue: sender.value)
      strawberryNumberLabel.text = changeNumber.description
      store.update(fruitName: .strawberry, number: changeNumber)
    case 1:
      let changeNumber = getChangeNumber(fruitName: banana, changeValue: sender.value)
      bananaNumberLabel.text = changeNumber.description
      store.update(fruitName: .banana, number: changeNumber)
    case 2:
      let changeNumber = getChangeNumber(fruitName: pineapple, changeValue: sender.value)
      pineappleNumberLabel.text = changeNumber.description
      store.update(fruitName: .pineapple, number: changeNumber)
    case 3:
      let changeNumber = getChangeNumber(fruitName: kiwi, changeValue: sender.value)
      kiwiNumberLabel.text = changeNumber.description
      store.update(fruitName: .kiwi, number: changeNumber)
    case 4:
      let changeNumber = getChangeNumber(fruitName: mango, changeValue: sender.value)
      mangoNumberLabel.text = changeNumber.description
      store.update(fruitName: .mango, number: changeNumber)
    default:
      return
    }
  }
  
  func getChangeNumber(fruitName: String?, changeValue: Double) -> Int {
    guard let fruitString = fruitName else { return 0 }
    guard let fruitNumber = Int(fruitString) else { return 0 }
    return fruitNumber + Int(changeValue)
  }
  
  func setMinimumValue() {
    guard let strawberryString = strawberry else { return }
    guard let strawberryDouble = Double(strawberryString) else { return }
    strawberryStepper.minimumValue = -strawberryDouble
    
    guard let bananaString = banana else { return }
    guard let bananaDouble = Double(bananaString) else { return }
    bananaStepper.minimumValue = -bananaDouble
    
    guard let pineappleString = pineapple else { return }
    guard let pineappleDouble = Double(pineappleString) else { return }
    pineappleStepper.minimumValue = -pineappleDouble
    
    guard let kiwiString = kiwi else { return }
    guard let kiwiDouble = Double(kiwiString) else { return }
    kiwiStepper.minimumValue = -kiwiDouble
    
    guard let mangoString = mango else { return }
    guard let mangoDouble = Double(mangoString) else { return }
    mangoStepper.minimumValue = -mangoDouble
  }
  
}
