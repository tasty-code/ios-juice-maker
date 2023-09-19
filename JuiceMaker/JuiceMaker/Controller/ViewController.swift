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
            guard let fruitName = JuiceMenu(rawValue: button.tag) else { return }
            try juiceMaker.makeJuice(menu: fruitName)
            displayAcceptAlert(fruitName: fruitName)
            displayFruitQuantity()
        } catch {
            displayFillStockAlert()
        }
    }
    
    func displayAcceptAlert(fruitName: JuiceMenu) {
        let alert = UIAlertController(
            title: "\(fruitName.description) 쥬스 나왔습니다",
            message: "맛있게 드세요!",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "감사합니다", style: .default))
        present(alert, animated: false, completion: nil)
    }
    
    func displayFillStockAlert() {
        let alert = UIAlertController(
            title: "재료가 부족해요",
            message: "재고를 수정할까요?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "채우러갈게요", style: .default))
        alert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        present(alert, animated: false, completion: nil)
    }
}
