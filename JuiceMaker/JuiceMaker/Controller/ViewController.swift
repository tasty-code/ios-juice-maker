//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for stock in stockLabels {
            stock.text = String(FruitStore.defaultStock)
        }
    }

    @IBAction func orderButton(_ sender: UIButton) {
        guard let buttonName = sender.currentTitle else {
            return
        }
        let juiceName = buttonName.components(separatedBy: " ")[0]
        for juice in Juice.allCases {
            guard juiceName == juice.rawValue else {
                continue
            }
            do {
                try juiceMaker.makeJuice(juice)
                let recipe = juice.recipe
                for (fruit, _) in recipe {
                    guard let fruitStock = juiceMaker.fruitStore.stockByFruit[fruit] else {
                        throw JuiceMakerError.notExistFruit
                    }
                    stockLabels[fruit.rawValue].text = String(fruitStock)
                    let alert = UIAlertController(title: nil, message: "\(juiceName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler : nil)
                    alert.addAction(okAction)
                    present(alert, animated: false, completion: nil)
                }
            } catch {
                print(error.localizedDescription)
                let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "예", style: .default, handler : {_ in
                    guard let addStockVC = self.storyboard?.instantiateViewController(withIdentifier: "addStockVC") else { return }
                    self.navigationController?.pushViewController(addStockVC, animated: true)
                })
                alert.addAction(okAction)
                let noAction = UIAlertAction(title: "아니오", style: .default, handler : nil)
                alert.addAction(noAction)
                present(alert, animated: false, completion: nil)
            }
        }
    }
}

