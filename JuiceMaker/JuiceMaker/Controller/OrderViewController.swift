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
    private let fruitStore: FruitStore
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
        self.fruitStore = FruitStore(fruitContainer: [
            .strawberry: 10,
            .banana: 10,
            .kiwi: 10,
            .pineapple: 10,
            .mango: 10,
        ])
        self.juiceMaker = JuiceMaker(fruitStore: self.fruitStore)
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
    @IBAction private func tapEditInventoryButton(_ sender: UIButton) {
        presentInventoryViewController()
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
                                   confirmAction: { [weak self] _ in
                self?.presentInventoryViewController()
            })
        }
    }
}

// MARK: - Custom Methods
extension OrderViewController {
    
    private func configureUI() {
        for (fruit, label) in labelsByFruit {
            let fruitQuantity = fruitStore.quantity(of: fruit)
            label.text = String(fruitQuantity)
        }
    }
    
    private func presentInventoryViewController() {
        guard let nextViewController = self.storyboard?.instantiateViewController(identifier: InventoryViewController.className, creator: { coder in
            return InventoryViewController(coder: coder, fruitStore: self.fruitStore)
        }) else { return }
        
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true)
    }

    func setUpFruitContainer(data: [Fruit: Int]) {
        fruitStore.updateFruitContainer(with: data)
    }
}
