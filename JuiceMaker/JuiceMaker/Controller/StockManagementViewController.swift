//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by yujaehong on 12/12/23.
//

import UIKit

final class StockManagementViewController: UIViewController {
    
    @IBOutlet private var numberOfStrawberryLabel: UILabel!
    @IBOutlet private var numberOfBananaLabel: UILabel!
    @IBOutlet private var numberOfPineAppleLabel: UILabel!
    @IBOutlet private var numberOfKiwiLabel: UILabel!
    @IBOutlet private var numberOfMangoLabel: UILabel!
    
    @IBOutlet private var changeAmountOfStrawberryStepper: UIStepper!
    @IBOutlet private var changeAmountOfBananaStepper: UIStepper!
    @IBOutlet private var changeAmountOfPineAppleStepper: UIStepper!
    @IBOutlet private var changeAmountOfKiwiStepper: UIStepper!
    @IBOutlet private var changeAmountOfMangoStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNumberOnLabel(fruits: receivedFruitInventoryData)
    }
    
    var receivedFruitInventoryData: [Fruit:Int] = [:]
    
}

// MARK: - Label 초기 셋팅
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
