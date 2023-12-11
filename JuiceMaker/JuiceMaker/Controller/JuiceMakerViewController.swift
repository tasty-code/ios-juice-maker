//
//  JuiceMaker - ViewController.swift
//  Created by Kyle& L
// 

import UIKit

class JuiceMakerViewController: UIViewController, FruitStockDelegate {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
        
    var juiceMaker = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()
    }
    
    func configureUI() {
        guard 
            let strawberryStock = juiceMaker.fruitStore.fruitStocks[.strawberry],
            let bananaStock = juiceMaker.fruitStore.fruitStocks[.banana],
            let pineappleStock = juiceMaker.fruitStore.fruitStocks[.pineapple],
            let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi],
            let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "재고수정",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(showFruitStoreViewController))
    }

    func showMakeJuiceCompleteAlert(juice: Juice) {
        let alert = UIAlertController(title: "\(juice.name) 나왔습니다!" , message: "맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .destructive))
        self.present(alert, animated: true)
    }
    
    func showUnderStockAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: { [weak self] _ in
            self?.showFruitStoreViewController()
        }))
        alert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        self.present(alert, animated: true)
    }
    
    func makeAndNotifyOrder(juice: Juice) throws {
        try juiceMaker.checkUnderstockedFruits(juice: juice)
            juiceMaker.makeJuice(juice: juice)
            showMakeJuiceCompleteAlert(juice: juice)
    }
    
    @objc
    func showFruitStoreViewController() {
        guard
            let fruitStoreViewController = storyboard?.instantiateViewController(identifier: "FruitStoreViewController") as? FruitStoreViewController
        else {
            return
        }
        
        fruitStoreViewController.strawberryStock = self.strawberryStockLabel.text ?? ""
        fruitStoreViewController.bananaStock = self.bananaStockLabel.text ?? ""
        fruitStoreViewController.pineappleStock = self.pineappleStockLabel.text ?? ""
        fruitStoreViewController.kiwiStock = self.kiwiStockLabel.text ?? ""
        fruitStoreViewController.mangoStock = self.mangoStockLabel.text ?? ""
        
        fruitStoreViewController.juiceMaker.fruitStore.fruitStocks = juiceMaker.fruitStore.fruitStocks
        
        self.navigationController?.pushViewController(fruitStoreViewController, animated: true)
        
        fruitStoreViewController.delegate = self
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
        do {
            try makeAndNotifyOrder(juice: .mangoKiwiJuice)
            guard
                let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi],
                let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
            else {
                return
            }
            kiwiStockLabel.text = String(kiwiStock)
            mangoStockLabel.text = String(mangoStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
    }
    
    @IBAction func strawberryJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .strawberryJuice)
            guard
                let strawberryStock = juiceMaker.fruitStore.fruitStocks[.strawberry]
            else {
                return
            }
            strawberryStockLabel.text = String(strawberryStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
    }
    
    @IBAction func bananaJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .bananaJuice)
            guard
                let bananaStock = juiceMaker.fruitStore.fruitStocks[.banana]
            else {
                return
            }
            bananaStockLabel.text = String(bananaStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
    }
    
    @IBAction func pineappleJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .pineappleJuice)
            guard
                let pineappleStock = juiceMaker.fruitStore.fruitStocks[.pineapple]
            else {
                return
            }
            pineappleStockLabel.text = String(pineappleStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
    }
    
    @IBAction func kiwiJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .kiwiJuice)
            guard
                let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi]
            else {
                return
            }
            kiwiStockLabel.text = String(kiwiStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
    }
    
    @IBAction func mangoJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .mangoJuice)
            guard
                let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
            else {
                return
            }
            mangoStockLabel.text = String(mangoStock)
        } catch {
            showUnderStockAlert(message: error.localizedDescription)
        }
    }
    
    func updateFruitStock(fruit: Fruits, count: Int) {
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(count)
            juiceMaker.fruitStore.fruitStocks[.strawberry] = count
        case .banana:
            bananaStockLabel.text = String(count)
            juiceMaker.fruitStore.fruitStocks[.banana] = count
        case .pineapple:
            pineappleStockLabel.text = String(count)
            juiceMaker.fruitStore.fruitStocks[.pineapple] = count
        case .kiwi:
            kiwiStockLabel.text = String(count)
            juiceMaker.fruitStore.fruitStocks[.kiwi] = count
        case .mango:
            mangoStockLabel.text = String(count)
            juiceMaker.fruitStore.fruitStocks[.mango] = count
        }
    }
}
