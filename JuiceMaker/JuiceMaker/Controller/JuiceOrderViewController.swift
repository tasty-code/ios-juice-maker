//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        updateFruitStockLabel()
    }
    
    @IBAction private func manageStockButtonTapped(_ sender: UIButton) {
        moveToManageStockView()
    }
    
    @IBAction private func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ").first else {
            let alert = Alert.create(title: "오류", message: JuiceMakerError.cannotFindLabel.description, okTitle: "확인") { }
            present(alert, animated: true)
            return
        }
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { 
            let alert = Alert.create(title: "오류", message: JuiceMakerError.cannotFindJuice.description, okTitle: "확인") { }
            present(alert, animated: true)
            return
        }
        order(juice: juice)
    }
    
    private func order(juice: Juice) {
        do {
            try juiceMaker.orderJuice(juice: juice)
            let alert = Alert.create(message: "\(juice.name) 나왔습니다! 맛있게 드세요!", okTitle: "확인") { }
            present(alert, animated: true)
            updateFruitStockLabel()
        } catch {
            let alert = Alert.create(message: JuiceMakerError.outOfStock.description, okTitle: "예") {[weak self] in
                self?.moveToManageStockView()
            }
            alert.addAction(UIAlertAction(title: "아니오", style: .default))
            present(alert, animated: true)
            updateFruitStockLabel()
        }
    }
    
    private func updateFruitStockLabel() {
        let stock = juiceMaker.fruitStore.fruitStock.compactMapValues { String($0) }
        
        strawberryLabel.text = stock[.strawberry]
        bananaLabel.text = stock[.banana]
        pineappleLabel.text = stock[.pineapple]
        kiwiLabel.text = stock[.kiwi]
        mangoLabel.text = stock[.mango]
    }
    
    private func moveToManageStockView() {
        guard let vc = storyboard?.instantiateViewController(identifier: ManageStockViewController.identifier) as? ManageStockViewController else {
            let alert = Alert.create(message: JuiceMakerError.cannotLoadManageStockView.description, okTitle: "확인") { }
            present(alert, animated: true)
            return
        }
        
        vc.fruitStock = juiceMaker.fruitStore.fruitStock
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension JuiceOrderViewController: Delegate {
    override func viewWillAppear(_ animated: Bool) {
        updateFruitStockLabel()
    }
    
    func fruitStock(fruitStock: [Fruit : UInt]) {
        for (index, _) in fruitStock.enumerated() {
            guard let fruit = Fruit(rawValue: index) else { return }
            juiceMaker.fruitStore.updateFruitStock(fruit: fruit, num: fruitStock[fruit] ?? 0)
        }
    }
}
