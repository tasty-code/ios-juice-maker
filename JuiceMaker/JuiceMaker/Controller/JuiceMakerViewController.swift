//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet var fruitLabels: [UILabel]!
    
    var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FruitStore.shared.updateDelegate = self
    }

    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juice = (sender as? MenuObject)?.juice else {
            return
        }
        do {
            try juiceMaker.make(juice: juice)
            madeJuiceAlert(juice: juice)
        } catch {
            shortOfStockAlert(message: error.localizedDescription)
        }
    }
}

extension JuiceMakerViewController: UpdateDelegate {
    func updateLabel(fruit: Fruits) {
        fruitLabels.forEach { label in
            guard let label = label as? FruitLabel,
                  label.fruit == fruit else { return }
            label.setting()
        }
    }
}

extension JuiceMakerViewController {
    func madeJuiceAlert(juice: Menu) {
        let alert = UIAlertController(
            title: "\(juice.koreanName) 나왔습니다! 맛있게 드세요",
            message: nil,
            preferredStyle: .alert
        )
        let checkAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(checkAction)
        self.present(alert, animated: true)
    }

    func shortOfStockAlert(message: String) {
        guard let modifiedStockVC = self.storyboard?.instantiateViewController(identifier: "ModifiedStock") else { return
        }
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
        self.present(alert, animated: true)
    }
}

protocol UpdateDelegate: AnyObject {
    func updateLabel(fruit: Fruits)
}
