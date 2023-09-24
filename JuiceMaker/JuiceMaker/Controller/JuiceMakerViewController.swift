//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    // MARK: - Properties
    
    private let juiceMaker = JuiceMaker()
    
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
    
    private func displayAcceptAlert(menuName: String) {
        let alert = UIAlertController(
            title: "\(menuName) 쥬스 나왔습니다",
            message: "맛있게 드세요!",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "감사합니다", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    private func displayFillStockAlert() {
        let alert = UIAlertController(
            title: "재료가 부족해요",
            message: "재고를 수정할까요?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
            self.presentStockManagerViewController()
        }))
        alert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        present(alert, animated: true, completion: nil)
    }
    
    private func presentStockManagerViewController() {
        guard let stockManagerViewController = self.storyboard?.instantiateViewController(identifier: "StockManagement") else { return }
        self.present(stockManagerViewController, animated: true, completion: nil)
    }
}
