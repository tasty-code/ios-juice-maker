//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    var fruit = FruitStore()
    var juiceMaker = JuiceMaker()
    
    @IBOutlet var strawberryLabel: UILabel!
    @IBOutlet var bananaLabel: UILabel!
    @IBOutlet var kiwiLabel: UILabel!
    @IBOutlet var pineappleLabel: UILabel!
    @IBOutlet var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let selectedJuice = selectedJuice(tag: sender.tag) else {
            return
        }
        
        let isOrderable = juiceMaker.makeJuice(juice: selectedJuice)
        switch isOrderable {
        case .success:
            successAlert(menu: selectedJuice)
        case .failure:
            failAlert()
        }
    }
    
    private func selectedJuice(tag: Int) -> Juice? {
        switch tag {
        case 0:
            return .strawberry
        case 1:
            return .banana
        case 2:
            return .pineapple
        case 3:
            return .kiwi
        case 4:
            return .mango
        case 5:
            return .strawberryBanana
        case 6:
            return .mangoKiwi
        default:
            return nil
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        guard let fruitStockViewController = storyboard?.instantiateViewController(identifier: "fruitStockViewController") as? FruitStockViewController else { return }
        self.present(fruitStockViewController, animated: true, completion: nil)
    }
    
    func updateFruitLabel() {
    }
    
    private func successAlert(menu: Juice) {
        let alert = UIAlertController(title: "\(menu)쥬스 나왔습니다!",
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
