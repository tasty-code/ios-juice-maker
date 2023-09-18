//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let juiceMakerModel = JuiceMaker()
    @IBOutlet weak var inventoryStackView : UIStackView!
    
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
    
    @IBAction func didTapRightNavigatorItem(_ sender: UIBarButtonItem) {
         let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "dashboardVC") as! DashboardViewController
        navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
        guard let tapped = sender.titleLabel, let label = tapped.text else {
            return
        }
        let splited = String(label.split(separator: " ")[0])
        print(splited)
        
        guard let retained = Menu(rawValue: splited) else {
            return
        }
        juiceMakerModel.order(retained)
        setFruitStock()
    }
}

