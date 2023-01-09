//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fruitLabels: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabelText(labels: fruitLabels)
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juice = Menu(rawValue: sender.tag) else {
            return
        }
        do {
            try JuiceMaker().make(juice: juice)
            madeJuiceAlert(juice: juice)
            updateLabelText(labels: fruitLabels)
        } catch {
            shortOfStockAlert(message: error.localizedDescription)
        }
    }

    private func updateLabelText(labels: [UILabel]) {
        let fruitStore = FruitStore.shared
        for label in labels {
            guard let fruit = Fruits(rawValue: label.tag) else {
                return
            }
            label.text = fruitStore.stock(fruit: fruit)
        }
    }

    private func madeJuiceAlert(juice: Menu) {
        let alert = UIAlertController(title: "\(juice.koreanName) 나왔습니다! 맛있게 드세요", message: nil, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(checkAction)
        self.present(alert, animated: true, completion: nil)
    }

    private func shortOfStockAlert(message: String) {
        guard let modifiedStockVC = self.storyboard?.instantiateViewController(identifier: "ModifiedStock") else { return }
        let alert = UIAlertController(title: "\(message)", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        let 재고수정Action = UIAlertAction(title: "예", style: .destructive, handler: { _ in
            self.present(modifiedStockVC, animated: true)
            })
        alert.addAction(cancelAction)
        alert.addAction(재고수정Action)
        alert.preferredAction = cancelAction
        self.present(alert, animated: true, completion: nil)
    }
}

