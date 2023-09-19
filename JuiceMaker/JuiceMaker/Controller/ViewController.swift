//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    private let juiceMakerModel = JuiceMaker()
    private @IBOutlet weak var inventoryStackView : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitStock()
    }
    
    func setFruitStock() {
        let allStocks = juiceMakerModel.getAllStocks()
        guard let outerStackView = inventoryStackView else {
            return
        }
        let innerStackView = outerStackView.arrangedSubviews.compactMap { (stack) -> [UIView]? in
            guard let inner = stack as? UIStackView else { return nil }
            return inner.arrangedSubviews
        }
        
        for label in innerStackView {
            guard let inner = label as? [UILabel] else { return }
            guard let emoji = inner[0].text else { return }
            guard let fruit = Fruit(rawValue: emoji) else { return }
            guard let amountLabel = allStocks[fruit] else { return }
            inner[1].text = String(amountLabel)
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
        
        guard let retained = Menu(rawValue: splited) else {
            return
        }
        if let availableMenu = juiceMakerModel.order(retained) {
            juiceMakerModel.makeJuice(availableMenu)
            showAlert(message: "\(availableMenu.rawValue) 나왔습니다! 맛있게 드세요!")
        } else {
            showSoldOutAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
        
        setFruitStock()
    }
    
    func navigateToDashboardViewController() {
        let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "dashboardVC") as! DashboardViewController
        navigationController?.pushViewController(dashboardVC, animated: true)
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

