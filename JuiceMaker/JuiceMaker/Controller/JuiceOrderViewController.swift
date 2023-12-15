//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitStockLabel()
    }
    
    @IBAction private func manageStockButtonTapped(_ sender: UIButton) {
        moveToManageStockView()
    }
    
    @IBAction private func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ")[0] else {
            let alert = Alert.createAlert(title: "오류", message: JuiceMakerError.cannotFindLabel.description, okTitle: "확인") { }
            present(alert, animated: true)
            return
        }
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { 
            let alert = Alert.createAlert(title: "오류", message: JuiceMakerError.cannotFindJuice.description, okTitle: "확인") { }
            return
        }
        order(juice: juice)
    }
    
    private func order(juice: Juice) {
        do {
            try juiceMaker.orderJuice(juice: juice)
            let alert = Alert.createAlert(message: "\(juice.name) 나왔습니다! 맛있게 드세요!", okTitle: "확인") { }
            present(alert, animated: true)
            updateFruitStockLabel()
        } catch {
            let alert = Alert.createAlert(message: JuiceMakerError.outOfStock.description, okTitle: "예") {
                self.moveToManageStockView()
            }
            alert.addAction(UIAlertAction(title: "아니오", style: .default))
            present(alert, animated: true)
            updateFruitStockLabel()
        }
    }
    
    private func updateFruitStockLabel() {
        let stock = fruitStore.fruitStock.compactMapValues { String($0) }
        
        strawberryLabel.text = stock[.strawberry]
        bananaLabel.text = stock[.banana]
        pineappleLabel.text = stock[.pineapple]
        kiwiLabel.text = stock[.kiwi]
        mangoLabel.text = stock[.mango]
    }
}

extension JuiceOrderViewController {
    func moveToManageStockView() {
        guard let viewController = storyboard?.instantiateViewController(identifier: NameSpace.manageStockVC) as? ManageStockViewController else { return }
        
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
    }
}
