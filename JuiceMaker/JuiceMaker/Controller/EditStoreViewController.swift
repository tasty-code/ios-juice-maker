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
  
  @IBAction func dismissButtonTapped(_ sender: UIButton) {
    self.delegate?.update()
    
    self.dismiss(animated: true)
  }
  
  @IBAction func stepperButtonTapped(_ sender: UIStepper) {
    let tag = sender.tag
    switch tag {
    case 0:
      guard let strawberryString = strawberry else { return }
      guard let strawberryNumber = Int(strawberryString) else { return }
      let strawberryChangeNumber = strawberryNumber + Int(sender.value)
      strawberryNumberLabel.text = strawberryChangeNumber.description
      store.update(fruitName: .strawberry, number: strawberryChangeNumber)
    case 1:
      guard let bananaString = banana else { return }
      guard let bananaNumber = Int(bananaString) else { return }
      let bananaChangeNumber = bananaNumber + Int(sender.value)
      bananaNumberLabel.text = bananaChangeNumber.description
      store.update(fruitName: .banana, number: bananaChangeNumber)
    case 2:
      guard let pineappleString = pineapple else { return }
      guard let pineappleNumber = Int(pineappleString) else { return }
      let pineappleChangeNumber = pineappleNumber + Int(sender.value)
      pineappleNumberLabel.text = pineappleChangeNumber.description
      store.update(fruitName: .pineapple, number: pineappleChangeNumber)
    case 3:
      guard let kiwiString = kiwi else { return }
      guard let kiwiNumber = Int(kiwiString) else { return }
      let kiwiChangeNumber = kiwiNumber + Int(sender.value)
      kiwiNumberLabel.text = kiwiChangeNumber.description
      store.update(fruitName: .kiwi, number: kiwiChangeNumber)
    case 4:
      guard let mangoString = mango else { return }
      guard let mangoNumber = Int(mangoString) else { return }
      let mangoChangeNumber = mangoNumber + Int(sender.value)
      mangoNumberLabel.text = mangoChangeNumber.description
      store.update(fruitName: .mango, number: mangoChangeNumber)
    default:
      return
    }
  }
  
  func setNumberLabel() {
    strawberryNumberLabel.text = strawberry
    bananaNumberLabel.text = banana
    pineappleNumberLabel.text = pineapple
    kiwiNumberLabel.text = kiwi
    mangoNumberLabel.text = mango
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
