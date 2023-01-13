//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController, FruitView {
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    private var fruitStore = FruitStore(defaultStock: 10)
    private var juiceMaker: JuiceMaker<FruitStore, Juice>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)

        updateLabels(of: Fruit.allCases)
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
        
        let isSucceed = juiceMaker.make(juice: juice)
        showResult(order: juice, result: isSucceed)
        
        let fruits = Array(juice.recipe.keys)
        updateLabels(of: fruits)
    }
    
    func showResult(order juice: Juice, result: Bool) {
        if result {
            showMessageAlert("\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
        } else {
            showFailAlert()
        }
    }
    
    private func showStoreView() {
        guard let storeNaviVC = storyboard?.instantiateViewController(withIdentifier: "storeNavi") as? UINavigationController else { return }
        
        storeNaviVC.modalPresentationStyle = .fullScreen
        storeNaviVC.modalTransitionStyle = .coverVertical
        
        present(storeNaviVC, animated: true)
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

extension JuiceMakerViewController {
    func updateLabels(of fruits:[Fruit]){
        guard let labels = fruitStockLabels as? [FruitComponent] else { return }
        let stocks = fruitStore.stockInfo(of: fruits)
        update(targets: labels, with: stocks)
    }
}
