//
//  EditStoreViewController.swift
//  JuiceMaker
//
//  Created by YEJI on 2023/09/19.
//

import UIKit

class EditStoreViewController: UIViewController {
  
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
    self.dismiss(animated: true)
  }
  
  @IBAction func stepperButtonTapped(_ sender: UIStepper) {
    let tag = sender.tag
    switch tag {
    case 0:
      guard let strawberryString = strawberry else { return }
      guard let strawberryNumber = Int(strawberryString) else { return }
      strawberryNumberLabel.text = (strawberryNumber + Int(sender.value)).description
    case 1:
      guard let bananaString = banana else { return }
      guard let bananaNumber = Int(bananaString) else { return }
      bananaNumberLabel.text = (bananaNumber + Int(sender.value)).description
    case 2:
      guard let pineappleString = pineapple else { return }
      guard let pineappleNumber = Int(pineappleString) else { return }
      pineappleNumberLabel.text = (pineappleNumber + Int(sender.value)).description
    case 3:
      guard let kiwiString = kiwi else { return }
      guard let kiwiNumber = Int(kiwiString) else { return }
      kiwiNumberLabel.text = (kiwiNumber + Int(sender.value)).description
    case 4:
      guard let mangoString = mango else { return }
      guard let mangoNumber = Int(mangoString) else { return }
      mangoNumberLabel.text = (mangoNumber + Int(sender.value)).description
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
