//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController, FruitStockDelegate {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func didUpdateFruitStock(fruitStock: [Fruits : Int]) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationViewController = segue.destination as? UINavigationController else { return }
        if let fruitStockViewController = navigationViewController.visibleViewController as? FruitStockViewController {
            fruitStockViewController.fruitStock = juiceMaker.fruitStore.fruitStock
            fruitStockViewController.delegate = self
        }
    }
    
    private func orderJuice(juice: Juice) {
        let isOrderable = juiceMaker.makeJuice(juice: juice)
        switch isOrderable {
        case true:
            presentSuccessAlert(menu: juice)
            configureView()
        case false:
            presentFailAlert()
        }
    }
    
    private func presentSuccessAlert(menu: Juice) {
        let alert = UIAlertController(title: "\(menu.rawValue) 나왔습니다!",
                                      message: "맛있게 드세요!",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func presentFailAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요.\n재고를 수정할까요?",
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "MoveToFruitStockView", sender: self)
        })
        let close = UIAlertAction(title: "아니요", style: .destructive)
        
        alert.addAction(confirm)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func touchUpStrawberryBananaJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .strawberryBanana)
    }
    
    @IBAction private func touchUpMangoKiwiJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .mangoKiwi)
    }
    
    @IBAction private func touchUpstrawberryJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .strawberry)
    }
    
    @IBAction private func touchUpBananaJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .banana)
    }
    
    @IBAction private func touchUpPineappleJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .pineapple)
    }
    
    @IBAction private func touchUpKiwiJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .kiwi)
    }
    
    @IBAction private func touchUpMangoJuiceOrderButton(_ sender: Any) {
        orderJuice(juice: .mango)
    }
}

extension JuiceMakerViewController {

    private func configureView() {
        strawberryLabel.text = String(juiceMaker.fruitStore.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.fruitStore.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.fruitStore.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.fruitStore.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.fruitStore.quantity(of: .mango))
    }
}
