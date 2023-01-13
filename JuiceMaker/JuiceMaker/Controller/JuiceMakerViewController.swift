//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    private let fruitStore = FruitStore(defaultStock: 10)
    private var juiceMaker: JuiceMaker<FruitStore, Juice>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        updateLabels(of: fruitStore.itemList)
    }
    
    @IBAction func touchesOrderButton(_ sender: UIButton) {
        let orderName = sender.currentTitle
        let juiceName = orderName?.replacingOccurrences(of: " 주문", with: "")
        guard let juice = Juice(rawValue: juiceName ?? "") else {
//            showMessageAlert("팔 수 없습니다.")
            return
        }
        
        let isSucceed = juiceMaker.make(juice: juice)
        showResult(order: juice, result: isSucceed)
        
        let fruits = Array(juice.recipe.keys)
        updateLabels(of: fruits)
    }
    
    @IBAction func touchesModifyStockButton(_ sender: UIBarButtonItem) {
        showStoreView()
    }
    
    func showResult(order juice: Juice, result: Bool) {
        if result {
            showDoneAlert(juice: juice)
        } else {
            showFailAlert()
        }
    }
}


//MARK: - Update Labels
extension JuiceMakerViewController: FruitView {
    func updateLabels(of fruits:[Fruit]){
        guard let labels = fruitStockLabels as? [FruitComponent] else { return }
        
        let stocks = fruitStore.stockInfo(of: fruits)
        update(targets: labels, with: stocks)
    }
}


//MARK: - StoreView로 전환

extension JuiceMakerViewController {
    private func showStoreView() {
        guard let storeNavi = buildStoreNavigationContoller(),
              let storeVC = buildStoreViewController() else { return }
        
        storeNavi.setViewControllers([storeVC], animated: true)
        present(storeNavi, animated: true)
    }
    
    private func buildStoreNavigationContoller() -> UINavigationController? {
        guard let storeNavigationContoller = storyboard?.instantiateViewController(withIdentifier: "storeNavi")
                as? UINavigationController else { return nil }
        
        storeNavigationContoller.modalPresentationStyle = .fullScreen
        storeNavigationContoller.modalTransitionStyle = .coverVertical
        return storeNavigationContoller
    }
    
    private func buildStoreViewController() -> StoreViewController? {
        guard let storeViewController = storyboard?.instantiateViewController(withIdentifier: "storeView")
                as? StoreViewController else { return nil }
        
        storeViewController.fruitStore = fruitStore
        storeViewController.delegate = self
        
        return storeViewController
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
    
    private func showDoneAlert(juice: Juice) {
        let alert = UIAlertController(title: nil,
                                      message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인",
                                          style: .default)
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
}
