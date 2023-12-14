//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet var orderJuiceButton: [UIButton]!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitLabel()
    }
    
    func setFruitLabel() {
        strawberryLabel.text = changeIntToStirng(fruit: .strawberry)
        bananaLabel.text =  changeIntToStirng(fruit: .banana)
        pineappleLabel.text = changeIntToStirng(fruit: .pineapple)
        kiwiLabel.text =  changeIntToStirng(fruit: .kiwi)
        mangoLabel.text =  changeIntToStirng(fruit: .mango)
        
    }
    func changeIntToStirng(fruit: Fruit) -> String {
        return String(FruitStore.shared.inventory(fruit: fruit))
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        switch sender {
        case orderJuiceButton[0]:
            order(juice: .strawberryBananaJuice, lables: strawberryLabel, bananaLabel)
        case orderJuiceButton[1]:
            order(juice: .mangoKiwiJuice, lables: mangoLabel, kiwiLabel)
        case orderJuiceButton[2]:
            order(juice: .strawberryJuice, lables: strawberryLabel)
        case orderJuiceButton[3]:
            order(juice: .bananaJuice, lables: bananaLabel)
        case orderJuiceButton[4]:
            order(juice: .pineappleJuice, lables: pineappleLabel)
        case orderJuiceButton[5]:
            order(juice: .kiwiJuice, lables: kiwiLabel)
        default:
            order(juice: .mangoJuice, lables: mangoLabel)
        }
    }
    
    func order(juice: Juice, lables: UILabel...) {
        do {
            try juiceMaker.make(juice: juice)
            showAlert(title: "완성", message: "\(juice.name) 나왔습니다! 맛있게 드세요", alertButton: false)
            setFruitLabel()
        } catch let error as JuiceMakerError {
            showAlert(title: "재고부족", message: "\(error.message)", alertButton: true) { _ in
                self.performSegue(withIdentifier: "InventoryView", sender: self)
            }
        } catch {
            print("에러")
        }
    }
}

