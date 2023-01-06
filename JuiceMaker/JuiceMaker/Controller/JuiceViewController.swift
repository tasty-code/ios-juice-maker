//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    private func configureUI() {
        for fruit in Fruit.allCases {
            updateStockLabel(of: fruit)
        }
    }
    
    func stockLabel(of fruit: Fruit) -> UILabel? {
        return fruitStockLabels.first { $0.tag == fruit.rawValue }
    }
    
    private func updateStockLabel(of fruit: Fruit) {
        guard let fruitStock = FruitStore.shared.stock[fruit] else { return }
        guard let stockLabel = stockLabel(of: fruit) else { return }
        
        stockLabel.text = String(fruitStock)
    }
    
    @IBAction private func juiceOrderButtonTapped(_ sender: UIButton) {
        guard let fruitJuice = FruitJuice(rawValue: sender.tag) else { return }
        do {
            try juiceMaker.makeJuice(of: fruitJuice)
            showMakeJuiceCompletedAlert(of: fruitJuice)
            for fruit in fruitJuice.recipe.keys {
                updateStockLabel(of: fruit)
            }
        } catch StockError.notEnoughToMakeJuice {
            showMakeJuiceFailedAlert()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction private func changeStockButtonTapped(_ sender: UIBarButtonItem) {
        moveToStockVC()
    }
    
    private func showMakeJuiceCompletedAlert(of fruitJuice: FruitJuice) {
        let alert = UIAlertController(title: "\(fruitJuice.name) 나왔습니다!",
                                      message: "맛있게 드세요!",
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "잘 먹을게요", style: .default)
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
    
    private func showMakeJuiceFailedAlert() {
        let stockError = StockError.notEnoughToMakeJuice
        
        let alert = UIAlertController(title: stockError.localizedDescription,
                                      message: stockError.userMessage,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "네", style: .default) { _ in
            self.moveToStockVC()
        }
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    private func moveToStockVC() {
        guard let stockVC = storyboard?.instantiateViewController(withIdentifier: "StockVC") else { return }
        navigationController?.pushViewController(stockVC, animated: true)
    }
}

