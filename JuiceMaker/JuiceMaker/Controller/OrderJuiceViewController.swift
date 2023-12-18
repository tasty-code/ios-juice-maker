//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import UIKit

class OrderJuiceViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet var orderJuiceButton: [UIButton]!
    
    let juiceMaker = JuiceMaker()
    let fruitStore: FruitStore = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialFruitLabel()
    }
    
    private func setInitialFruitLabel() {
        strawberryLabel.text = "\(fruitStore.inventory(fruit: .strawberry))"
        bananaLabel.text =  "\(fruitStore.inventory(fruit: .banana))"
        pineappleLabel.text = "\(fruitStore.inventory(fruit: .pineapple))"
        kiwiLabel.text =  "\(fruitStore.inventory(fruit: .kiwi))"
        mangoLabel.text =  "\(fruitStore.inventory(fruit: .mango))"
        
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            order(juice: .strawberryBananaJuice)
        case 1:
            order(juice: .mangoKiwiJuice)
        case 2:
            order(juice: .strawberryJuice)
        case 3:
            order(juice: .bananaJuice)
        case 4:
            order(juice: .pineappleJuice)
        case 5:
            order(juice: .kiwiJuice)
        case 6:
            order(juice: .mangoJuice)
        default:
            print("메뉴 준비중입니다.")
            showAlert(title: "주문불가", message: "메뉴 준비중입니다.")
        }
    }
    
    private func order(juice: Juice) {
        do {
            try juiceMaker.make(juice: juice)
            showAlert(title: "완성", message: "\(juice.name) 나왔습니다! 맛있게 드세요")
            setInitialFruitLabel()
        } catch let error as JuiceMakerError {
            print("\(error.message)")
            showAlertWithConfirmation(title: "재고부족", message: "\(error.message)") { _ in
                self.performSegue(withIdentifier: "InventoryView", sender: self)
            }
        } catch {
            print("에러")
            showAlert(title: "에러", message: "예상치 못한 에러가 발생했습니다.")
        }
    }
}

