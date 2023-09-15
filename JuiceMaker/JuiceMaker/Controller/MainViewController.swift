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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveInventory" {
            guard let vc = segue.destination as? FruitInventoryViewController else { return }
            vc.juiceMaker = self.juiceMaker
        }
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
            print(error)
        }
    }
    
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let id = sender.accessibilityIdentifier else { return }
        
        do {
            let recipe = try identifyJuiceMenu(btnIdentifier: id)
            try juiceMaker.makeJuice(order: recipe)
            remainFruit()
        } catch {
            print(error)
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
            throw InventoryError.invalidMenuError
        }
    }
}

