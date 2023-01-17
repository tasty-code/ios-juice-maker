//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {

    @IBOutlet private var fruitStockLabels: [UILabel]!
    
    private let fruitStore = FruitStore(count: FruitStock.initial)
    private var juiceMaker: JuiceMaker<FruitStore, FruitJuice>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        updateLabels(of: fruitStore.itemList)
    }
    
    @IBAction private func touchesOrderButton(_ sender: UIButton) {
        guard let button = sender as? FruitJuiceButton else { return }
        
        let juice = button.juice
        let isSucceed = juiceMaker.make(juice: juice)
        showResultAlert(order: juice, result: isSucceed)
        
        let fruits = Array(juice.ingredients)
        updateLabels(of: fruits)
    }
    
    @IBAction private func touchesModifyStockButton(_ sender: UIBarButtonItem) {
        showStoreView()
    }
    
    private func showResultAlert(order juice: FruitJuice, result: Bool) {
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
        guard let storeNavigationContoller = storyboard?.instantiateViewController(withIdentifier: ViewController.storeNavi)
                as? UINavigationController else { return nil }
        
        storeNavigationContoller.modalPresentationStyle = .fullScreen
        storeNavigationContoller.modalTransitionStyle = .coverVertical
        return storeNavigationContoller
    }
    
    private func buildStoreViewController() -> StoreViewController? {
        guard let storeViewController = storyboard?.instantiateViewController(withIdentifier: ViewController.store)
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
                                          message: Alert.Message.emptyStock,
                                          preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: Alert.ButtonTitle.yes,
                                          style: .default,
                                          handler: { _ in self.showStoreView() })
        let cancelAction = UIAlertAction(title: Alert.ButtonTitle.no,
                                         style: .cancel)
        
        failAlert.addAction(confirmAction)
        failAlert.addAction(cancelAction)
        present(failAlert, animated: true)
    }
    
    private func showDoneAlert(juice: FruitJuice) {
        let alert = UIAlertController(title: nil,
                                      message: Alert.Message.done(juice),
                                      preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: Alert.ButtonTitle.confirm,
                                          style: .default)
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
}
