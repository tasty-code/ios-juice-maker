//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    private let juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFruitsStock()
    }
    
    @IBAction private func manageStockButton(_ sender: UIButton) {
        moveToManageStockView()
    }
    
    @IBAction private func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ")[0] else { return }
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { return }
        orderJuice(juice: juice)
    }
    
    private func orderJuice(juice: Juice) {
        do {
            try juiceMaker.orderJuice(juice: juice)
            present(Alert.createAlertController(alertType: .defaultAlert, title: nil, message: "\(juice.name) 나왔습니다! 맛있게 드세요!", view: self), animated: true)
            checkFruitsStock()
        } catch {
            present(Alert.createAlertController(alertType: .outOfStockAlert, title: nil, message: JuiceMakerError.outOfStock.description, view: self), animated: true)
            checkFruitsStock()
        }
    }
    
    private func checkFruitsStock() {
        let stock = fruitStore.fruitStock.compactMapValues { String($0) }
        
        strawberryLabel.text = stock[.strawberry]
        bananaLabel.text = stock[.banana]
        pineappleLabel.text = stock[.pineapple]
        kiwiLabel.text = stock[.kiwi]
        mangoLabel.text = stock[.mango]
    }
}

extension UIViewController {
    func moveToManageStockView() {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "viewController") as? ManageStockViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
