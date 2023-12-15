//
//  JuiceMaker - ViewController.swift
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadFruitsCount()
    }
    
    @IBAction private func adjustingStockButtonTapped(_ sender: UIButton) {
        showNavigationView()
    }
    
    @IBAction private func strawberryJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .딸기쥬스)
    }
    
    @IBAction private func bananaJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .바나나쥬스)
    }
    
    @IBAction private func pineappleJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .파인애플쥬스)
    }
    
    @IBAction private func kiwiJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .키위쥬스)
    }
    
    @IBAction private func mangoJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .망고쥬스)
    }
    
    @IBAction private func strawberryBananaJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .딸바쥬스)
    }
    
    @IBAction private func mangoKiwiJuiceButtonTapped(_ sender: UIButton) {
        orderJuice(menu: .망고키위쥬스)
    }
    
    private func reloadFruitsCount() {
        strawberryCountLabel.text = fruitStore.storage[.strawberry]?.description
        bananaCountLabel.text = fruitStore.storage[.banana]?.description
        pineappleCountLabel.text = fruitStore.storage[.pineapple]?.description
        kiwiCountLabel.text = fruitStore.storage[.kiwi]?.description
        mangoCountLabel.text = fruitStore.storage[.mango]?.description
    }
    
    private func showNavigationView() {
        let supplyViewController = storyboard?.instantiateViewController(withIdentifier: "SupplyViewController") as! SupplyViewController
        navigationController?.pushViewController(supplyViewController, animated: true)
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
    
    private func alertJuiceServed(menu: JuiceMaker.Menu) {
        let alert = UIAlertController(title: "", message: "\(menu) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let juiceServedAlertAction = UIAlertAction(title: "쥬스 수령", style: .default)
        
        alert.addAction(juiceServedAlertAction)
        present(alert, animated: true)
    }
    
    private func alertInsufficientStock() {
        let alert = UIAlertController(title: "", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAlertAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.showNavigationView()
        })
        let noAlertAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(yesAlertAction)
        alert.addAction(noAlertAction)
        present(alert, animated: true)
    }
}
