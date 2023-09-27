//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class JuiceMakerViewController: UIViewController, StockEditDelegate {
    
    // MARK: - Properties
    
    private let juiceMaker = JuiceMaker()
    private var acceptAlertFactory: AlertFactoryService!
    private var yesOrNoAlertFactory: AlertFactoryService!
    
    // MARK: - Views
    
    @IBOutlet private var strawberryQuantityLabel: StrawberryQuantityLabel!
    @IBOutlet private var bananaQuantityLabel: BananaQuantityLabel!
    @IBOutlet private var pineappleQuantityLabel: PineappleQuantityLabel!
    @IBOutlet private var kiwiQuantityLabel: KiwiQuantityLabel!
    @IBOutlet private var mangoQuantityLabel: MangoQuantityLabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayFruitQuantity()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayFruitQuantity),
                                               name: Notification.Name("stockDidChanged"),
                                               object: nil)
        
        acceptAlertFactory = AcceptAlertFactory(alertActionDelegate: self)
        yesOrNoAlertFactory = YesOrNoAlertFactory(alertActionDelegate: self)
    }
    
    // MARK: - Methods
    
    @objc private func displayFruitQuantity() {
        let fruitQuantityLabels: [FruitQuantityLabel] = [strawberryQuantityLabel,
                                                         bananaQuantityLabel,
                                                         pineappleQuantityLabel,
                                                         kiwiQuantityLabel,
                                                         mangoQuantityLabel]
        
        for label in fruitQuantityLabels {
            guard let furit = label.fruit() else { continue }
            let fruitQuantity = juiceMaker.fruitStore.quantity(of: furit)
            label.text = String(fruitQuantity)
        }
    }
    
    @IBAction func pressOrderButton(_ button: JuiceButton) {
        guard let menu = button.pickMenu() else { return }
        do {
            try juiceMaker.makeJuice(menu: menu)
            displayAcceptAlert(menuName: menu.description)
        } catch {
            displayFillStockAlert()
        }
    }
    
    @IBAction func pressEditButton(_ sender: UIBarButtonItem) {
        presentStockManagerViewController()
    }
    private func displayAcceptAlert(menuName: String) {
        let alertViewData = AlertViewData(title: "\(menuName) 쥬스 나왔습니다",
                                          message: "맛있게 드세요!",
                                          style: UIAlertController.Style.alert,
                                          okActionTitle: "감사합니다",
                                          cancelActionTitle: nil)
        let alert = acceptAlertFactory.build(alertData: alertViewData)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func displayFillStockAlert() {
        let alertViewData = AlertViewData(title: "재료가 부족해요",
                                          message: "재고를 수정할까요?",
                                          style: UIAlertController.Style.alert,
                                          okActionTitle: "예",
                                          cancelActionTitle: "아니요")
        let alert = yesOrNoAlertFactory.build(alertData: alertViewData)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func presentStockManagerViewController() {
        guard let stockManagerViewController = self.storyboard?.instantiateViewController(identifier: "StcokManagerViewController") as? StockManagerViewController else { return }
        stockManagerViewController.fruitStock = juiceMaker.fruitStore.getFruitStock()
        stockManagerViewController.stockEditionDelegate = self
        self.present(stockManagerViewController, animated: true, completion: nil)
    }
    
    func sendChangedStock(_ fruitStock: [Fruit : Int]) {
        juiceMaker.fruitStore.updateStock(fruitStock)
    }
}

extension JuiceMakerViewController: AceeptAlertActionDelegate {
    func okAction() { }
}

extension JuiceMakerViewController: YesOrNoAlertActionDelegate {
    func yesAction() {
        presentStockManagerViewController()
    }
    func noAction() { }
}
