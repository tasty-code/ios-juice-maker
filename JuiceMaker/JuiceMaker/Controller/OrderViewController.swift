//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet private weak var strawberryQuantityLabel: UILabel!
    @IBOutlet private weak var bananaQuantityLabel: UILabel!
    @IBOutlet private weak var pineappleQuantityLabel: UILabel!
    @IBOutlet private weak var kiwiQuantityLabel: UILabel!
    @IBOutlet private weak var mangoQuantityLabel: UILabel!
    
    // MARK: Properties
    private var fruitStore: FruitStore
    private let juiceMaker: JuiceMaker
    private lazy var labelsByFruit: [Fruit: UILabel] = [
        .strawberry: strawberryQuantityLabel,
        .banana: bananaQuantityLabel,
        .pineapple: pineappleQuantityLabel,
        .kiwi: kiwiQuantityLabel,
        .mango: mangoQuantityLabel
    ]
    
    // MARK: Initializer
    required init?(coder aDecoder: NSCoder) {
        self.fruitStore = FruitStore.shared
        self.juiceMaker = JuiceMaker()
        super.init(coder: aDecoder)
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI()
    }

    // MARK: @IBAction
    @IBAction private func tapEditInventoryButton(_ sender: UIBarButtonItem) {
        pushInventoryViewController()
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
                self.pushInventoryViewController()
            })
        }
    }
}

// MARK: - Custom Methods
extension OrderViewController {
    
    private func configureUI() {
        for (fruit, label) in labelsByFruit {
            label.text = String(fruitStore.fruitContainer[fruit, default: 0])
        }
    }
    
    private func pushInventoryViewController() {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
