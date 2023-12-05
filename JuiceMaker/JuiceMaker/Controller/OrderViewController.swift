//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    
    let fruitStore = FruitStore.shared
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }

    @IBAction func tapEditInventoryButton(_ sender: UIBarButtonItem) {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @IBAction func tapMakeJuiceButton(_ sender: UIButton) {
        guard let selectedJuice = sender.currentTitle else {
            return
        }
        
        switch selectedJuice {
        case "딸기쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .strawberry)
            } catch {
                print("재고가 없습니다.")
            }
        case "바나나쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .banana)
            } catch {
                print("재고가 없습니다.")
            }
        case "키위쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .kiwi)
            } catch {
                print("재고가 없습니다.")
            }
        case "파인애플쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .pineapple)
            } catch {
                print("재고가 없습니다.")
            }
        case "딸바쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .strawberryBanana)
            } catch {
                print("재고가 없습니다.")
            }
        case "망고쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .mangoKiwi)
            } catch {
                print("재고가 없습니다.")
            }
        case "망키쥬스 주문":
            do {
                try juiceMaker.makeJuice(juiceType: .strawberry)
            } catch {
                print("재고가 없습니다.")
            }
        default:
            print("")
        }
    }
    
    func configUI() {
        strawberryQuantityLabel.text = String(fruitStore.strawberry)
        bananaQuantityLabel.text = String(fruitStore.banana)
        pineappleQuantityLabel.text = String(fruitStore.pineapple)
        kiwiQuantityLabel.text = String(fruitStore.kiwi)
        mangoQuantityLabel.text = String(fruitStore.mango)
    }
}

