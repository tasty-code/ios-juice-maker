//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
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
        remainFruit()
    }
        
    private func remainFruit() {
        do {
            let strawberry = try juiceMaker.remainingCount(fruit: .strawberry)
            strawberryLabel.text = String(strawberry)
            
            let banana = try juiceMaker.remainingCount(fruit: .banana)
            bananaLabel.text = String(banana)
            
            let kiwi = try juiceMaker.remainingCount(fruit: .kiwi)
            kiwiLabel.text = String(kiwi)
            
            let pineapple = try juiceMaker.remainingCount(fruit: .pineapple)
            pineappleLabel.text = String(pineapple)
            
            let mango = try juiceMaker.remainingCount(fruit: .mango)
            mangoLabel.text = String(mango)
        } catch {
            defaultAlert(message: InventoryError.invalidError.description)
        }
    }
    
    @IBAction func moveInventory(_ sender: UIButton) {
        self.moveInventoryVC()
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let id = sender.accessibilityIdentifier else { return }
        
        do {
            let recipe = try identifyJuiceMenu(btnIdentifier: id)
            try juiceMaker.makeJuice(order: recipe)
            remainFruit()
            defaultAlert(message: "\(recipe.recipeName)쥬스 나왔습니다! 맛있게 드세요!")
        } catch InventoryError.noLongerConsumeError {
            juiceMakeFailAlert(message: InventoryError.noLongerConsumeError.description)
        } catch {
            defaultAlert(message: InventoryError.invalidError.description)
        }
    }
}

extension MainViewController {
    private func identifyJuiceMenu(btnIdentifier: String) throws -> JuiceMenu {
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
        guard let inventoryVC = self.storyboard?.instantiateViewController(identifier: "Inventory") as? FruitInventoryViewController else { return }
        inventoryVC.juiceMaker = self.juiceMaker
        self.navigationController?.pushViewController(inventoryVC, animated: true)
    }
    
    private func defaultAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yes = UIAlertAction(title: "예", style: .default)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    private func juiceMakeFailAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "예", style: .default) { _ in
            self.moveInventoryVC()
        }
        let no = UIAlertAction(title: "아니오", style: .destructive)
        alert.addAction(yes)
        alert.addAction(no)
        alert.preferredAction = yes
        present(alert, animated: true)
    }
}

