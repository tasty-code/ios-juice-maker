//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBAction private func orderJuice(_ sender: UIButton) {
        guard let sender = sender.titleLabel?.text?.replacingOccurrences(of: " 주문", with: ""),
              let selectedJuice = Juice(rawValue: sender) else { return }
    
        let isOrderable = juiceMaker.makeJuice(juice: selectedJuice)
        switch isOrderable {
        case .success:
            successAlert(menu: selectedJuice)
            configureView()
        case .failure:
            failAlert()
        }
    }
    
    @IBAction private func addButton(_ sender: UIButton) {
        guard let fruitStockViewController = storyboard?.instantiateViewController(identifier: "fruitStockViewController") as? FruitStockViewController else { return }
        self.present(fruitStockViewController, animated: true, completion: nil)
    }
    
    private func successAlert(menu: Juice) {
        let alert = UIAlertController(title: "\(menu.rawValue) 나왔습니다!",
                                      message: "맛있게 드세요!",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func failAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요.\n재고를 수정할까요?",
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.addButton(UIButton())
        })
        let close = UIAlertAction(title: "아니요", style: .destructive)
        
        alert.addAction(confirm)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}

extension JuiceMakerViewController {

    private func configureView() {
        strawberryLabel.text = String(juiceMaker.fruitStore.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.fruitStore.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.fruitStore.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.fruitStore.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.fruitStore.quantity(of: .mango))
    }
}
