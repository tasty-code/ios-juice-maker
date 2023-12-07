//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFruitsStock()
    }


    @IBAction func ManageStockButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "viewController") as? ManageStockViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ")[0] else { return }
        print(juiceName)
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { return }
        orderJuice(juice: juice)
    }
    
    func orderJuice(juice: Juice) {
        do {
            print("재료 준비")
            try juiceMaker.orderJuice(juice: juice)
            print("\(juice.name) 주문 성공!!!")
            checkFruitsStock()
        } catch {
            print(error)
        }
    }
    
    func checkFruitsStock() {
        strawberryLabel.text = String(juiceMaker.fruitStore.fruitStock[.strawberry] ?? 0)
        bananaLabel.text = String(juiceMaker.fruitStore.fruitStock[.banana] ?? 0)
        pineappleLabel.text = String(juiceMaker.fruitStore.fruitStock[.pineapple] ?? 0)
        kiwiLabel.text = String(juiceMaker.fruitStore.fruitStock[.kiwi] ?? 0)
        mangoLabel.text = String(juiceMaker.fruitStore.fruitStock[.mango] ?? 0)
    }
}
