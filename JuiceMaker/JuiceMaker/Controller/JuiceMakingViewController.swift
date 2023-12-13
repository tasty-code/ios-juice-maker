//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakingViewController: UIViewController {

    @IBOutlet var numberOfStrawberry: UILabel!
    @IBOutlet var numberOfBanana: UILabel!
    @IBOutlet var numberOfPineApple: UILabel!
    @IBOutlet var numberOfKiwi: UILabel!
    @IBOutlet var numberOfMango: UILabel!
    
    @IBOutlet var orderStrawberryButton: UIButton!
    @IBOutlet var orderBananaButton: UIButton!
    @IBOutlet var orderPineAppleButton: UIButton!
    @IBOutlet var orderKiwiButton: UIButton!
    @IBOutlet var orderMangoButton: UIButton!
    @IBOutlet var orderStrawberryBananaButton: UIButton!
    @IBOutlet var orderMangoKiwiButton: UIButton!

    let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNumberOnLabel(fruits: juiceMaker.fruitStore.inventory)
        setUpTargetActionOnButtons()
        
        
        
    }
    
}

extension JuiceMakingViewController {
    func setUp(number: Int, on label:UILabel) {
        label.text = String(number)
    }
    
    func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberry)
            case .banana:
                setUp(number: fruit.value, on: numberOfBanana)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineApple)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwi)
            case .mango:
                setUp(number: fruit.value, on: numberOfMango)
            }
        }
    }
}

extension JuiceMakingViewController {
    func setUpTargetActionOnButtons() {
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for:.touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
    }
    
    @objc func orderJuice(_ sender: UIButton) {
        let result: JuiceMaker.JuiceMakingResult
        
        switch sender {
        case orderStrawberryButton:
            result = juiceMaker.produce(.strawberry)
        case orderBananaButton:
            result = juiceMaker.produce(.banana)
        case orderPineAppleButton:
            result = juiceMaker.produce(.pineapple)
        case orderKiwiButton:
            result = juiceMaker.produce(.kiwi)
        case orderMangoButton:
            result = juiceMaker.produce(.mango)
        case orderStrawberryBananaButton:
            result = juiceMaker.produce(.strawberryBanana)
        case orderMangoKiwiButton:
            result = juiceMaker.produce(.mangoKiwi)
        default:
            let message = "???"
            result = .failure(description: message)
        }
        
        self.present(generateAlert(by: result), animated: true, completion: nil)
        
    }
    
    func generateAlert(by result: JuiceMaker.JuiceMakingResult) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        switch result {
        case .success(let message):
            alert.message = message
            alert.addAction(UIAlertAction(title: "확인", style: .default))
        case .failure(let message):
            alert.message = message
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: transitionToStockManagement(_:)))
            alert.addAction(UIAlertAction(title: "아니오", style: .default))
        }
        return alert
    }
}

extension JuiceMakingViewController {
    func transitionToStockManagement(_ sender: UIAlertAction) {
        let segue = "segueToStockManagement"
        performSegue(withIdentifier: segue, sender: sender)
    }
}
