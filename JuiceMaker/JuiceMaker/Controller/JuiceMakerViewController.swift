//
//  JuiceMaker - ViewController.swift
//  Created by Kyle& L
//

import UIKit

final class JuiceMakerViewController: UIViewController, JuiceMakerAlert {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
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
    
    private func makeAndNotifyOrder(juice: Juice) throws {
        try juiceMaker.checkUnderstockedFruits(juice: juice)
        juiceMaker.makeJuice(juice: juice)
        showJuiceMakerAlert(viewController: self, isCompletedMakeJucie: true, message: "\(juice.name) 나왔습니다! 맛있게 드세요!")
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
        
        self.navigationController?.pushViewController(fruitStoreViewController, animated: true)
    }
   
    @IBAction private func tappedStrawberryBananaJuiceButton(_ sender: UIButton) {
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
            showJuiceMakerAlert(viewController: self, 
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
    
    @IBAction private func tappedMangoKiwiJuiceButton(_ sender: UIButton) {
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
            showJuiceMakerAlert(viewController: self,
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
    
    @IBAction private func tappedStrawberryJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .strawberryJuice)
            guard
                let strawberryStock = juiceMaker.fruitStore.fruitStocks[.strawberry]
            else {
                return
            }
            strawberryStockLabel.text = String(strawberryStock)
        } catch {
            showJuiceMakerAlert(viewController: self,
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
    
    @IBAction private func tappedBananaJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .bananaJuice)
            guard
                let bananaStock = juiceMaker.fruitStore.fruitStocks[.banana]
            else {
                return
            }
            bananaStockLabel.text = String(bananaStock)
        } catch {
            showJuiceMakerAlert(viewController: self,
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
    
    @IBAction private func tappedPineappleJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .pineappleJuice)
            guard
                let pineappleStock = juiceMaker.fruitStore.fruitStocks[.pineapple]
            else {
                return
            }
            pineappleStockLabel.text = String(pineappleStock)
        } catch {
            showJuiceMakerAlert(viewController: self,
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
    
    @IBAction private func tappedKiwiJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .kiwiJuice)
            guard
                let kiwiStock = juiceMaker.fruitStore.fruitStocks[.kiwi]
            else {
                return
            }
            kiwiStockLabel.text = String(kiwiStock)
        } catch {
            showJuiceMakerAlert(viewController: self,
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
    
    @IBAction private func tappedMangoJuiceButtonTapped(_ sender: UIButton) {
        do {
            try makeAndNotifyOrder(juice: .mangoJuice)
            guard
                let mangoStock = juiceMaker.fruitStore.fruitStocks[.mango]
            else {
                return
            }
            mangoStockLabel.text = String(mangoStock)
        } catch {
            showJuiceMakerAlert(viewController: self,
                                isCompletedMakeJucie: false,
                                message: error.localizedDescription)
        }
    }
}
