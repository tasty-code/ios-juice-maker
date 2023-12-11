//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    
    private let fruitStore = FruitStore.shared
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawberryQuantityLabel: UILabel!
    @IBOutlet private weak var bananaQuantityLabel: UILabel!
    @IBOutlet private weak var pineappleQuantityLabel: UILabel!
    @IBOutlet private weak var kiwiQuantityLabel: UILabel!
    @IBOutlet private weak var mangoQuantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    @IBAction private func tapEditInventoryButton(_ sender: UIBarButtonItem) {
        pushNextViewController()
    }
    
    @IBAction private func tapMakeJuiceButton(_ sender: UIButton) {
        guard let selectedButtonTitle = sender.currentTitle,
              let juice = Juice(rawValue: selectedButtonTitle) else {
            return
        }
        
        do {
            try juiceMaker.makeJuice(juiceType: juice)
            configureUI()
            presentAlert(title: "쥬스 제조 완료",
                         message: "\(selectedButtonTitle.components(separatedBy: " ").first ?? "") 나왔습니다! 맛있게 드세요",
                         confirmTitle: "확인")
        } catch {
            presentAlertWithCancel(title: "재고 부족 알림",
                                   message: "재료가 모자라요. 재고를 수정할까요?",
                                   confirmTitle: "예",
                                   cancelTitle: "아니오",
                                   confirmAction: { _ in
                self.pushNextViewController()
            })
        }
    }
    
    private func configureUI() {
        strawberryQuantityLabel.text = String(fruitStore.fruitContainer[.strawberry, default: 0])
        bananaQuantityLabel.text = String(fruitStore.fruitContainer[.banana, default: 0])
        pineappleQuantityLabel.text = String(fruitStore.fruitContainer[.pineapple, default: 0])
        kiwiQuantityLabel.text = String(fruitStore.fruitContainer[.kiwi, default: 0])
        mangoQuantityLabel.text = String(fruitStore.fruitContainer[.mango, default: 0])
    }
    
    private func pushNextViewController() {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

