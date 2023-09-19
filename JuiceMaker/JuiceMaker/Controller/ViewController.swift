//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let juiceMaker = JuiceMaker()
    
    // MARK: - Views
    
    @IBOutlet private var strawberryQuantityLabel: UILabel!
    @IBOutlet private var bananaQuantityLabel: UILabel!
    @IBOutlet private var pineappleQuantityLabel: UILabel!
    @IBOutlet private var kiwiQuantityLabel: UILabel!
    @IBOutlet private var mangoQuantityLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        displayFruitQuantity()
    }
    
    // MARK: - Methods
    
    private func displayFruitQuantity() {
        let fruitQuantityLabels: [UILabel] = [strawberryQuantityLabel,
                                              bananaQuantityLabel,
                                              pineappleQuantityLabel,
                                              kiwiQuantityLabel,
                                              mangoQuantityLabel]
        
        for label in fruitQuantityLabels {
            guard let fruit = Fruit(rawValue: label.tag) else { continue }
            let fruitQuantity = juiceMaker.checkFruit(fruit: fruit)
            label.text = String(fruitQuantity)
        }
    }
    
    @IBAction private func pressOrderButton(_ button: UIButton)  {
        do {
            guard let menu = JuiceMenu(rawValue: button.tag) else { return }
            try juiceMaker.makeJuice(menu: menu)
            displayAcceptAlert(menuName: menu.description)
            displayFruitQuantity()
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
            self.presentStockManager()
        }))
        alert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        present(alert, animated: true, completion: nil)
    }
    
    private func presentStockManager() {
        guard let presentViewController = self.storyboard?.instantiateViewController(identifier: "StockManagement") else { return }
        self.present(presentViewController, animated: true, completion: nil)
    }
}
