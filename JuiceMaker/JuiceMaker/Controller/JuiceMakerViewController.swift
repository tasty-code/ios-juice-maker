//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private let fruitStore = FruitStore()
    private lazy var juiceMaker = JuiceMaker(fruitStore: fruitStore)

    @IBOutlet private var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
    }
    
    private func updateStockLabels() {
        for (stockLabel, stock) in zip(stockLabels, fruitStore.stockByFruit.values) {
            stockLabel.text = String(stock)
        }
    }

    private func alertJuiceReady(juiceName: String) {
        let alert = UIAlertController(title: nil, message: "\(juiceName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler : nil)
        alert.addAction(okAction)
        present(alert, animated: false)
    }

    private func alertOutOfStock() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler : { _ in
            self.presentAddStockViewController()
        })
        alert.addAction(okAction)
        let noAction = UIAlertAction(title: "아니오", style: .default, handler : nil)
        alert.addAction(noAction)
        present(alert, animated: false)
    }

    private func changeStockLabel(juice: Juice) {
        for (fruit, _) in juice.recipe {
            let fruitStock = fruitStore.stock(byFruit: fruit)
            stockLabels[fruit.sequence].text = String(fruitStock)
        }
        alertJuiceReady(juiceName: juice.name)
    }

    private func order(juice: Juice) {
        do {
            try juiceMaker.make(juice: juice)
            changeStockLabel(juice: juice)
        } catch JuiceMakerError.outOfStock {
            alertOutOfStock()
        } catch {
            print(error.localizedDescription)
        }
    }

    func presentAddStockViewController() {
        guard let addStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddStockViewController") as? AddStockViewController else { return }
        addStockViewController.fruitStore = self.fruitStore
        addStockViewController.modalPresentationStyle = .fullScreen
        self.present(addStockViewController, animated: true)
    }

    @IBAction func addStockButton(_ sender: UIBarButtonItem) {
        presentAddStockViewController()
    }


    @IBAction private func orderButton(_ sender: UIButton) {
        guard let buttonName = sender.currentTitle else { return }
        let juiceName = buttonName.components(separatedBy: " ")[0]
        let juice = Juice.allCases.filter {
            $0.name == juiceName
        }[0]
        order(juice: juice)
    }
}