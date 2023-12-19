//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by yujaehong on 12/12/23.
//

import UIKit

final class StockManagementViewController: UIViewController {
    
    @IBOutlet var numberOfStrawberryLabel: UILabel!
    @IBOutlet var numberOfBananaLabel: UILabel!
    @IBOutlet var numberOfPineAppleLabel: UILabel!
    @IBOutlet var numberOfKiwiLabel: UILabel!
    @IBOutlet var numberOfMangoLabel: UILabel!
    
    @IBOutlet var changeAmountOfStrawberryStepper: UIStepper!
    @IBOutlet var changeAmountOfBananaStepper: UIStepper!
    @IBOutlet var changeAmountOfPineAppleStepper: UIStepper!
    @IBOutlet var changeAmountOfKiwiStepper: UIStepper!
    @IBOutlet var changeAmountOfMangoStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNumberOnLabel(fruits: receivedData)
        
    }
    
    var receivedData: [Fruit:Int] = [:]
    
}

private extension StockManagementViewController {
    func setUp(number: Int, on label:UILabel) {
        label.text = String(number)
    }
    
    func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberryLabel)
            case .banana:
                setUp(number: fruit.value, on: numberOfBananaLabel)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineAppleLabel)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwiLabel)
            case .mango:
                setUp(number: fruit.value, on: numberOfMangoLabel)
            }
        }
    }
}
