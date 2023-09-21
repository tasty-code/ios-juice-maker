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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNumberLabel()
  }
  
  @IBAction func dismissButtonTapped(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
  
  @IBAction func stepperButtonTapped(_ sender: UIStepper) {
    let tag = sender.tag
    switch tag {
    case 0:
      strawberryNumberLabel.text = Int(sender.value).description
    case 1:
      bananaNumberLabel.text = Int(sender.value).description
    case 2:
      pineappleNumberLabel.text = Int(sender.value).description
    case 3:
      kiwiNumberLabel.text = Int(sender.value).description
    case 4:
      mangoNumberLabel.text = Int(sender.value).description
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
}
