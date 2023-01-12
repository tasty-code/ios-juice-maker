//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private var fruitLabelFruitMap: [UILabel: Fruit]!
    private var fruitStore = FruitStore(defaultStock: 10)
    private var juiceMaker: JuiceMaker<FruitStore>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        
        fruitLabelFruitMap = [
            strawberryStockLabel: .strawberry,
            bananaStockLabel: .banana,
            pineappleStockLabel: .pineapple,
            kiwiStockLabel: .kiwi,
            mangoStockLabel: .mango
        ]
        
        updateStockValue()
    }
    
    @IBAction func touchesModifyStockButton(_ sender: UIBarButtonItem) {
        showStoreView()
    }
    
    @IBAction func touchesOrderButton(_ sender: UIButton) {
        let orderName = sender.currentTitle
        let juiceName = orderName?.replacingOccurrences(of: " 주문", with: "")
        guard let juice = Juice(rawValue: juiceName ?? "") else {
            showMessageAlert("팔 수 없습니다.")
            return
        }
        // 고민해보기
        showResult(juice: juice)
        updateStockValue()
    }
    
    func showResult(juice: Juice) {
        do {
            try juiceMaker.make(juice: juice)
            showMessageAlert("\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
        } catch is JuiceMakerError {
            showFailAlert()
        } catch {
            showMessageAlert("\(error)")
        }
    }
    
    private func showStoreView() {
        guard let storeNaviVC = storyboard?.instantiateViewController(withIdentifier: "storeNavi") as? UINavigationController else { return }
        
        storeNaviVC.modalPresentationStyle = .fullScreen
        storeNaviVC.modalTransitionStyle = .coverVertical
        
        present(storeNaviVC, animated: true)
    }
    
    private func updateStockValue() {
        for (label, fruit) in fruitLabelFruitMap {
            label.text = String(fruitStore.items[fruit, default: 0])
        }
    }
}

//MARK: - Alert 구현
extension JuiceMakerViewController {
    private func showFailAlert() {
        let failAlert = UIAlertController(title: nil,
                                          message: "재고가 모자라요. 재고를 수정할까요?",
                                          preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "예",
                                          style: .default,
                                          handler: { _ in self.showStoreView() })
        let cancelAction = UIAlertAction(title: "아니오",
                                         style: .cancel)
        
        failAlert.addAction(confirmAction)
        failAlert.addAction(cancelAction)
        present(failAlert, animated: true)
    }
    
    private func showMessageAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                             message: message,
                                             preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인",
                                          style: .default)
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
}
