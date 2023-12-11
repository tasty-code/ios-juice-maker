//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    @IBAction private func manageStockButtonTapped(_ sender: UIButton) {
        moveToManageStockView()
    }
    
    @IBAction private func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ")[0] else { return present(Alert.createAlertController(alertType: .defaultAlert, title: nil, message: JuiceMakerError.cannotFindLabel.description, view: nil), animated: true) }
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { return present(Alert.createAlertController(alertType: .defaultAlert, title: nil, message: JuiceMakerError.cannotFindJuice.description, view: nil), animated: true) }
        order(juice: juice)
    }
    
    private func order(juice: Juice) {
        do {
            try juiceMaker.orderJuice(juice: juice)
            present(Alert.createAlertController(alertType: .defaultAlert, title: nil, message: "\(juice.name) 나왔습니다! 맛있게 드세요!", view: self), animated: true)
            updateFruitStockLabel()
        } catch {
            present(Alert.createAlertController(alertType: .outOfStockAlert, title: nil, message: JuiceMakerError.outOfStock.description, view: self), animated: true)
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

extension UIViewController {
    func moveToManageStockView() {
        guard let viewController = storyboard?.instantiateViewController(identifier: NameSpace.manageStockVC) as? ManageStockViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
