//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawBerryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingLabel()
    }
}

extension ViewController {
    private func bindingLabel() {
        do {
            strawBerryLabel.text = try juiceMaker.getRemainingFruits(.strawberry)
            bananaLabel.text = try juiceMaker.getRemainingFruits(.banana)
            pineappleLabel.text = try juiceMaker.getRemainingFruits(.pineapple)
            kiwiLabel.text = try juiceMaker.getRemainingFruits(.kiwi)
            mangoLabel.text = try juiceMaker.getRemainingFruits(.mango)
        } catch {
            statusAlert(ErrorMessage.invalidInput.debugDescription)
        }
    }
    
    private func statusAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func failAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "취소", style: .default)
        let changeAction = UIAlertAction(title: "이동", style: .default, handler: { action in
            self.moveToStockVc()
        })
        
        alert.addAction(cancleAction)
        alert.addAction(changeAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func moveToStockVc() {
        guard let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as? StockViewController else {
            return
        }
        stockVC.injectModel(self.juiceMaker)
        stockVC.delegate = self
        self.navigationController?.pushViewController(stockVC, animated: true)
    }
    
    private func makeOrder(_ menu: Juice) {
        let orderResult = juiceMaker.makingJuice(menu)
        if orderResult.success {
            bindingLabel()
            statusAlert(orderResult.message)
            return
        }
        failAlert(orderResult.message)
    }
}

extension ViewController {
    @IBAction func OrderStrawberryBananaJuice(_ sender: UIButton) {
        let menu = Juice.strawberryBananaJuice
        makeOrder(menu)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        let menu = Juice.mangoKiwiJuice
        makeOrder(menu)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        let menu = Juice.strawberryJuice
        makeOrder(menu)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        let menu = Juice.bananaJuice
        makeOrder(menu)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        let menu = Juice.pineappleJuice
        makeOrder(menu)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        let menu = Juice.kiwiJuice
        makeOrder(menu)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        let menu = Juice.mangoJuice
        makeOrder(menu)
    }
    
    @IBAction private func showPush() {
        moveToStockVc()
    }
}

extension ViewController: SendStockDelegate {
    func sendStock(updatedModel: JuiceMaker) {
        do {
            strawBerryLabel.text = try updatedModel.getRemainingFruits(.strawberry)
            bananaLabel.text = try updatedModel.getRemainingFruits(.banana)
            pineappleLabel.text = try updatedModel.getRemainingFruits(.pineapple)
            kiwiLabel.text = try updatedModel.getRemainingFruits(.kiwi)
            mangoLabel.text = try updatedModel.getRemainingFruits(.mango)
        } catch {
            statusAlert(ErrorMessage.invalidInput.debugDescription)
        }
    }
}


