//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fruitLabels: [UILabel]!
    
    let fruitStore = FruitStore.shared
    var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        fruitStore.textUpdateDelegate = self
        juiceMaker.juiceAlertDelegate = self
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juice = Menu(rawValue: sender.tag) else {
            return
        }
        juiceMaker.order(juice: juice)
    }

    private func setupLabel() {
        fruitLabels.forEach { label in
            guard let fruit = Fruits(rawValue: label.tag) else {
                return
            }
            let quantity = fruitStore.stock(fruit: fruit)
            label.text = String(quantity)
        }
    }
}

extension ViewController: textUpdateDelegate {
    func updateLabel(fruit: Fruits) {
        fruitLabels.forEach { label in
            if label.tag == fruit.rawValue {
                let quantity = fruitStore.stock(fruit: fruit)
                label.text = String(quantity)
            }
        }
    }
}

extension ViewController: juiceAlertDelegate {
    func madeJuiceAlert(juice: Menu) {
        let alert = UIAlertController(
            title: "\(juice.koreanName) 나왔습니다! 맛있게 드세요",
            message: nil,
            preferredStyle: .alert
        )
        let checkAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(checkAction)
        self.present(alert, animated: true, completion: nil)
    }

    func shortOfStockAlert(message: String) {
        guard let modifiedStockVC = self.storyboard?.instantiateViewController(identifier: "ModifiedStock") else { return }
        let alert = UIAlertController(
            title: "\(message)",
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        let modifiedAction = UIAlertAction(title: "예", style: .destructive) { _ in
            self.present(modifiedStockVC, animated: true)
            }
        alert.addAction(cancelAction)
        alert.addAction(modifiedAction)
        alert.preferredAction = modifiedAction
        self.present(alert, animated: true, completion: nil)
    }
}

protocol textUpdateDelegate: AnyObject {
    func updateLabel(fruit: Fruits)
}

protocol juiceAlertDelegate: AnyObject {
    func madeJuiceAlert(juice: Menu)
    func shortOfStockAlert(message: String)
}
