//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initIdentifier()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitLabels()
    }
    
    private func initIdentifier() {
        strawberryLabel.accessibilityIdentifier = "딸기"
        bananaLabel.accessibilityIdentifier = "바나나"
        pineappleLabel.accessibilityIdentifier = "파인애플"
        kiwiLabel.accessibilityIdentifier = "키위"
        mangoLabel.accessibilityIdentifier = "망고"
        
        strawberryJuiceButton.accessibilityIdentifier = "딸기쥬스"
        bananaJuiceButton.accessibilityIdentifier = "바나나쥬스"
        pineappleJuiceButton.accessibilityIdentifier = "파인애플쥬스"
        kiwiJuiceButton.accessibilityIdentifier = "키위쥬스"
        mangoJuiceButton.accessibilityIdentifier = "망고쥬스"
        strawberryBananaJuiceButton.accessibilityIdentifier = "딸바쥬스"
        mangoKiwiJuiceButton.accessibilityIdentifier = "망키쥬스"
    }
        
    private func updateFruitLabels() {
        let fruitLabels = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel]
        
        fruitLabels.forEach { label in
            guard let tempLabel = label, let id = tempLabel.accessibilityIdentifier else {
                return
            }
            do {
                guard let fruit = try Fruit(id) else {
                    return
                }
                let count = try juiceMaker.remainingCount(fruit: fruit)
                tempLabel.text = "\(count)"
            } catch {
                defaultAlert(message: InventoryError.invalidError.description)
            }
        }
    }
    
    @IBAction func changeInventoryButtonTapped(_ sender: UIButton) {
        self.moveInventoryVC()
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let id = sender.accessibilityIdentifier else {
            return
        }
        do {
            let menu = try menuForJuiceButton(btnIdentifier: id)
            try juiceMaker.makeJuice(order: menu)
            updateFruitLabels()
            defaultAlert(message: "\(menu.recipeName)쥬스 나왔습니다! 맛있게 드세요!")
        } catch InventoryError.noLongerConsumeError {
            juiceMakeFailAlert(message: InventoryError.noLongerConsumeError.description)
        } catch {
            defaultAlert(message: InventoryError.invalidError.description)
        }
    }
}

extension MainViewController {
    private func menuForJuiceButton(btnIdentifier: String) throws -> JuiceMenu {
        switch btnIdentifier {
        case "딸기쥬스":
            return .strawberryJuice
        case "바나나쥬스":
            return .bananaJuice
        case "파인애플쥬스":
            return .pineappleJuice
        case "키위쥬스":
            return .kiwiJuice
        case "망고쥬스":
            return .mangoJuice
        case "딸바쥬스":
            return .strawberryBananaJuice
        case "망키쥬스":
            return .mangoKiwiJuice
        default:
            throw InventoryError.invalidError
        }
    }
    
    private func moveInventoryVC () {
        guard let inventoryVC = self.storyboard?.instantiateViewController(identifier: "Inventory") as? FruitInventoryViewController else {
            return
        }
        inventoryVC.juiceMaker = self.juiceMaker
        let navigationVC = UINavigationController(rootViewController: inventoryVC)
        navigationVC.modalTransitionStyle = .crossDissolve
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
    
    private func defaultAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default)
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func juiceMakeFailAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .destructive) { _ in
            self.moveInventoryVC()
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true)
    }
}
