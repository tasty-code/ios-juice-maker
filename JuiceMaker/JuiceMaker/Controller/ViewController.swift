//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    private let juiceMakerModel = JuiceMaker()
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }
    
    private func updateStock() {
        let fruitsUILabels = [strawberryStockLabel: Fruit.strawberry , bananaStockLabel: Fruit.banana , kiwiStockLabel: Fruit.kiwi  ,pineappleStockLabel: Fruit.pineapple, mangoStockLabel: Fruit.mango]
        let fruitStocks = juiceMakerModel.getAllStocks()
        
        for (remainFruit, fruit) in fruitsUILabels {
            guard let amount = fruitStocks[fruit] else {
                return
            }
            remainFruit?.text = String(amount)
        }
    }
    
    @IBAction private func didTapRightNavigatorItem(_ sender: UIBarButtonItem) {
        navigateToDashboardViewController()
    }
    
    @IBAction private func didTapJuiceButton(_ sender: UIButton) {
        guard let tapped = sender.titleLabel, let label = tapped.text else {
            return
        }
        
        let splited = String(label.split(separator: " ")[0])
        
        guard let retained = Menu.allCases.first(where: { $0.juice == splited }) else {
            return
        }
        
        if let availableMenu = juiceMakerModel.order(retained) {
            juiceMakerModel.makeJuice(availableMenu)
            updateStock()
            showAlert(message: "\(splited) 나왔습니다! 맛있게 드세요!")
        } else {
            showSoldOutAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func navigateToDashboardViewController() {
        let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "dashboardVC") as! DashboardViewController
        dashboardVC.delegate = self
        dashboardVC.juiceMakerModel = self.juiceMakerModel
        present(dashboardVC, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showSoldOutAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default)  { action in
            self.navigateToDashboardViewController() }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: DashboardViewControllerDelegate {
    func didUpdateData() {
        self.updateStock()
    }
}

