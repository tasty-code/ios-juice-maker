//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by yujaehong on 12/12/23.
//

import UIKit

protocol StockManagementViewControllerDelegate: AnyObject {
    func updateStockData(updatedData: [Fruit: Int])
}

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
    
    @IBAction func cancleButtonPressed(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        changeStock(fruits: receivedFruitInventoryData)
        delegate?.updateStockData(updatedData: receivedFruitInventoryData)
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    weak var delegate: StockManagementViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNumberOnLabel(fruits: receivedFruitInventoryData)
        setupTargetActionOnStepper()
        setupStepper(fruits: receivedFruitInventoryData)
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

// MARK: - stepper 설정
private extension StockManagementViewController {
    func setupTargetActionOnStepper() {
        changeAmountOfStrawberryStepper.addTarget(self, action: #selector(changeAmount(_:)), for: .valueChanged)
        changeAmountOfBananaStepper.addTarget(self, action: #selector(changeAmount(_:)), for: .valueChanged)
        changeAmountOfPineAppleStepper.addTarget(self, action: #selector(changeAmount(_:)), for: .valueChanged)
        changeAmountOfKiwiStepper.addTarget(self, action: #selector(changeAmount(_:)), for: .valueChanged)
        changeAmountOfMangoStepper.addTarget(self, action: #selector(changeAmount(_:)), for: .valueChanged)
    }
    
    @objc func changeAmount(_ sender: UIStepper) {
        switch sender {
        case changeAmountOfStrawberryStepper:
            if let result = receivedFruitInventoryData[.strawberry] {
                numberOfStrawberryLabel.text = (Int(sender.value) + result).description
            }
        case changeAmountOfBananaStepper:
            if let result = receivedFruitInventoryData[.banana] {
                numberOfBananaLabel.text = (Int(sender.value) + result).description
            }
        case changeAmountOfPineAppleStepper:
            if let result = receivedFruitInventoryData[.pineapple] {
                numberOfPineAppleLabel.text = (Int(sender.value) + result).description
            }
        case changeAmountOfKiwiStepper:
            if let result = receivedFruitInventoryData[.kiwi] {
                numberOfKiwiLabel.text = (Int(sender.value) + result).description
            }
        case changeAmountOfMangoStepper:
            if let result = receivedFruitInventoryData[.mango] {
                numberOfMangoLabel.text = (Int(sender.value) + result).description
            }
        default:
            return
        }
    }
    
    func setup(number: Int, on stepper: UIStepper) {
        stepper.minimumValue = -Double(number)
        stepper.maximumValue = 100
    }
    
    func setupStepper(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setup(number: fruit.value, on: changeAmountOfStrawberryStepper)
            case .banana:
                setup(number: fruit.value, on: changeAmountOfBananaStepper)
            case .pineapple:
                setup(number: fruit.value, on: changeAmountOfPineAppleStepper)
            case .kiwi:
                setup(number: fruit.value, on: changeAmountOfKiwiStepper)
            case .mango:
                setup(number: fruit.value, on: changeAmountOfMangoStepper)
            }
        }
    }
}

// MARK: - 변경된 값 저장
private extension StockManagementViewController {
    func changeAmount(_ fruit: Fruit, _ number: Int) {
        receivedFruitInventoryData[fruit] = number
    }
    
    func changeStock(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                if let num = numberOfStrawberryLabel.text, let num = Int(num) {
                    changeAmount(.strawberry, num)
                }
            case .banana:
                if let num = numberOfBananaLabel.text, let num = Int(num) {
                    changeAmount(.banana, num)
                }
            case .pineapple:
                if let num = numberOfPineAppleLabel.text, let num = Int(num) {
                    changeAmount(.pineapple, num)
                }
            case .kiwi:
                if let num = numberOfKiwiLabel.text, let num = Int(num) {
                    changeAmount(.kiwi, num)
                }
            case .mango:
                if let num = numberOfMangoLabel.text, let num = Int(num) {
                    changeAmount(.mango, num)
                }
            }
        }
    }
}
