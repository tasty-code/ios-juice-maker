//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class JuiceMakingViewController: UIViewController {
    
    @IBOutlet var numberOfStrawberryLabel: UILabel!
    @IBOutlet var numberOfBananaLabel: UILabel!
    @IBOutlet var numberOfPineAppleLabel: UILabel!
    @IBOutlet var numberOfKiwiLabel: UILabel!
    @IBOutlet var numberOfMangoLabel: UILabel!
    
    @IBOutlet var orderStrawberryButton: UIButton!
    @IBOutlet var orderBananaButton: UIButton!
    @IBOutlet var orderPineAppleButton: UIButton!
    @IBOutlet var orderKiwiButton: UIButton!
    @IBOutlet var orderMangoButton: UIButton!
    @IBOutlet var orderStrawberryBananaButton: UIButton!
    @IBOutlet var orderMangoKiwiButton: UIButton!
    
    @IBOutlet var stockChangeButton: UIBarButtonItem!
    
    private let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumberOnLabel(fruits: juiceMaker.fruitStore.inventory)
        setUpTargetActionOnButtons()
        registerObserver()
    }
    
    deinit {
        turnOffObserver()
    }
    
    private func dataToStockManagementViewController() {
        if let stockManagementVC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagementViewController") as? StockManagementViewController {
            stockManagementVC.receivedData = juiceMaker.fruitStore.inventory
            let stockManagementNavigationController = UINavigationController(rootViewController: stockManagementVC)
            
            stockManagementNavigationController.modalPresentationStyle = .pageSheet
            stockManagementNavigationController.sheetPresentationController?.detents = [.large(), .medium()]
            stockManagementNavigationController.sheetPresentationController?.preferredCornerRadius = 30
            stockManagementNavigationController.sheetPresentationController?.prefersEdgeAttachedInCompactHeight = true
            
            self.present(stockManagementNavigationController, animated: true, completion: nil)
        }
    }
    
}

private extension JuiceMakingViewController {
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

private extension JuiceMakingViewController {
    func setUpTargetActionOnButtons() {
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for:.touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        
        stockChangeButton.target = self
        stockChangeButton.action = #selector(stockChangeButtonTapped)
        
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
            let message = "잘못된입력입니다"
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
    
    @objc func stockChangeButtonTapped() {
        dataToStockManagementViewController()
    }
}

private extension JuiceMakingViewController {
    func transitionToStockManagement(_ sender: UIAlertAction) {
        dataToStockManagementViewController()
    }
}

private extension JuiceMakingViewController {
    func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeFruitsAmount(_:)), name: Notification.Name("fruitsAmountDidChange"), object: nil)
    }
    
    @objc func didChangeFruitsAmount(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let fruitInfo = userInfo as? [Fruit : Int] else {
            return
        }
        
        self.showNumberOnLabel(fruits: fruitInfo)
    }
    
    func turnOffObserver() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("fruitsAmountDidChange"), object: nil)
    }
    
}
