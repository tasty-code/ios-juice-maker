//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
        
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        reloadFruitsCount()
    }
    
    @IBAction private func updatingStockButtonTapped(_ sender: UIBarButtonItem) {
        showStockViewModal()
    }
    
    @IBAction private func strawberryJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .딸기쥬스)
    }
    
    @IBAction private func bananaJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .바나나쥬스)
    }
    
    @IBAction private func pineappleJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .파인애플쥬스)
    }
    
    @IBAction private func kiwiJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .키위쥬스)
    }
    
    @IBAction private func mangoJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .망고쥬스)
    }
    
    @IBAction private func strawberryBananaJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .딸바쥬스)
    }
    
    @IBAction private func mangoKiwiJuiceOrderButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .망고키위쥬스)
    }
    
    private func orderJuice(menu: JuiceMaker.Menu) {
        do {
            try juiceMaker.makeJuice(menu: menu)
            alertJuiceServed(menu: menu)
            reloadFruitsCount()
        } catch {
            print(error)
            alertInsufficientStock()
        }
    }
    
    private func showStockViewModal() {
        let stockViewNavigationController = storyboard?.instantiateViewController(withIdentifier: "StockViewNavigationController") as! UINavigationController
        if let stockViewController = stockViewNavigationController.viewControllers.first as? StockViewController {
            stockViewController.delegate = self
        }
        present(stockViewNavigationController, animated: true)
    }
    
    private func alertJuiceServed(menu: JuiceMaker.Menu) {
        let alert = UIAlertController(title: "", message: "\(menu) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let juiceServedAlertAction = UIAlertAction(title: "쥬스 수령", style: .default)
        
        alert.addAction(juiceServedAlertAction)
        present(alert, animated: true)
    }
    
    private func alertInsufficientStock() {
        let alert = UIAlertController(title: "", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAlertAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.showStockViewModal()
        })
        let noAlertAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(yesAlertAction)
        alert.addAction(noAlertAction)
        present(alert, animated: true)
    }
    
    private func reloadFruitsCount() {
        strawberryCountLabel.text = String(describing: fruitStore.storage[.strawberry] ?? 0)
        bananaCountLabel.text = String(describing: fruitStore.storage[.banana] ?? 0)
        pineappleCountLabel.text = String(describing: fruitStore.storage[.pineapple] ?? 0)
        kiwiCountLabel.text = String(describing: fruitStore.storage[.kiwi] ?? 0)
        mangoCountLabel.text = String(describing: fruitStore.storage[.mango] ?? 0)
    }
}

extension JuiceViewController: StockViewControllerDelegate {
    func stockViewControllerWillDisappear() {
        reloadFruitsCount()
    }
}
