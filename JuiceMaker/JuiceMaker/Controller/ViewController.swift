//
//  JuiceMaker - ViewController.swift
//  Created by Kyle& L
// 

import UIKit

class ViewController: UIViewController {
    
    var juiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()
    }
    func configureUI() {
        guard 
            let strawberryStock = juiceMaker.fruitStore.fruitStocks[.strawberry]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        guard
            let bananaStock = juiceMaker.fruitStore.fruitStocks[.banana]
        else {
            return
        }
        bananaStockLabel.text = String(bananaStock)
        guard
            let pineappleStock = juiceMaker.fruitStore.fruitStocks[.pineapple]
        else {
            return
        }
        pineappleStockLabel.text = String(pineappleStock)
        guard
            let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi]
        else {
            return
        }
        kiwiStockLabel.text = String(kiwiStock)
        guard
            let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
        else {
            return
        }
        mangoStockLabel.text = String(mangoStock)
    }

    func showMakeJuiceCompleteAlert(juice: Juice) {
        let alert = UIAlertController(title: "\(juice.name) 나왔습니다!" , message: "맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .default))
        self.present(alert, animated: true)
    }
    
    func showUnderStockAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default))
        alert.addAction(UIAlertAction(title: "아니요", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func makeAndNotifyOrder(juice: Juice) throws {
        try juiceMaker.checkUnderstockedFruits(juice: juice)
            juiceMaker.makeJuice(juice: juice)
            showMakeJuiceCompleteAlert(juice: juice)
    }
    
    func setJuiceIngredients(juice: Juice) {
        for ingredient in juice.recipe {
            //
        }
    }
    
    @IBAction func strawberryBananaJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .strawberryBananaJuice)
            guard
                let strawberryStock = juiceMaker.fruitStore.fruitStocks[.strawberry],
                let bananaStock = juiceMaker.fruitStore.fruitStocks[.banana]
            else {
                return
            }
            strawberryStockLabel.text = String(strawberryStock)
            bananaStockLabel.text = String(bananaStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
       
    }
    
    @IBAction func mangoKiwiJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(juice: .mangoKiwiJuice)
        guard
            let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi]
        else {
            return
        }
        kiwiStockLabel.text = String(kiwiStock)
        guard
            let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
        else {
            return
        }
        mangoStockLabel.text = String(mangoStock)
    }
    
    @IBAction func strawberryJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(juice: .strawberryJuice)
        guard
            let strawberryStock = juiceMaker.fruitStore.fruitStocks[.strawberry]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
    }
    
    @IBAction func bananaJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(juice: .bananaJuice)
        guard
            let bananaStock = juiceMaker.fruitStore.fruitStocks[.banana]
        else {
            return
        }
        bananaStockLabel.text = String(bananaStock)
    }
    
    @IBAction func pineappleJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(juice: .pineappleJuice)
        guard
            let pineappleStock = juiceMaker.fruitStore.fruitStocks[.pineapple]
        else {
            return
        }
        pineappleStockLabel.text = String(pineappleStock)
    }
    
    @IBAction func kiwiJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(juice: .kiwiJuice)
        guard
            let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi]
        else {
            return
        }
        kiwiStockLabel.text = String(kiwiStock)
    }
    
    @IBAction func mangoJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(juice: .mangoJuice)
        guard
            let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
        else {
            return
        }
        mangoStockLabel.text = String(mangoStock)
    }
    
}

