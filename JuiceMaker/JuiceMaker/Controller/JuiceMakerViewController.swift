//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    let fruitStore = FruitStore()
    lazy var juiceMaker = JuiceMaker(fruitStore: fruitStore)

    @IBOutlet var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for stockLabel in stockLabels {
            stockLabel.text = String(10)
        }
    }

    func makeJuiceAlert(juiceName: String) {
        let alert = UIAlertController(title: nil, message: "\(juiceName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler : nil)
        alert.addAction(okAction)
        present(alert, animated: false)
    }

    func outOfStockAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler : {_ in
            guard let addStockVC = self.storyboard?.instantiateViewController(withIdentifier: "addStockVC") else { return }
            self.navigationController?.pushViewController(addStockVC, animated: true)
        })
        alert.addAction(okAction)
        let noAction = UIAlertAction(title: "아니오", style: .default, handler : nil)
        alert.addAction(noAction)
        present(alert, animated: false)
    }

    func changeStockLabel(juice: Juice) {
        for (fruit, _) in juice.recipe {
            let fruitStock = juiceMaker.fruitStore.stock(byFruit: fruit)
            stockLabels[fruit.rawValue].text = String(fruitStock)
        }
        makeJuiceAlert(juiceName: juice.rawValue)
    }

    func order(juice: Juice) {
        do {
            try juiceMaker.make(juice: juice)
            changeStockLabel(juice: juice)
        } catch JuiceMakerError.outOfStock {
            outOfStockAlert()
        } catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func orderButton(_ sender: UIButton) {
        guard let buttonName = sender.currentTitle else {
            return
        }
        let juiceName = buttonName.components(separatedBy: " ")[0]
        let juice = Juice.allCases.filter { $0.rawValue == juiceName }[0]
        order(juice: juice)
    }
}
