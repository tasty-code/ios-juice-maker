//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMenuViewController: UIViewController {
    private var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
        bananaCountLabel.text = "\(FruitStore.shared.banana)"
        pineappleCountLabel.text = "\(FruitStore.shared.pineapple)"
        kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
        mangoCountLabel.text = "\(FruitStore.shared.mango)"
    }
    
    @IBAction func strawberryBananaPressed(_ sender: Any) {
        order(menu: .strawberrydBananaJuice)
        strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
        bananaCountLabel.text = "\(FruitStore.shared.banana)"
    }
    @IBAction func strawberryPressed(_ sender: Any) {
        order(menu: .strawberryJuice)
        strawberryCountLabel.text = "\(FruitStore.shared.strawberry)"
    }
    @IBAction func bananaPressed(_ sender: Any) {
        order(menu: .bananaJuice)
        bananaCountLabel.text = "\(FruitStore.shared.banana)"
    }
    @IBAction func pineapplePressed(_ sender: Any) {
        order(menu: .pineappleJuice)
        pineappleCountLabel.text = "\(FruitStore.shared.pineapple)"
    }
    @IBAction func mangoKiwiPressed(_ sender: Any) {
        order(menu: .mangoKiwiJuice)
        kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
        mangoCountLabel.text = "\(FruitStore.shared.mango)"
    }
    @IBAction func kiwiPressed(_ sender: Any) {
        order(menu: .kiwiJuice)
        kiwiCountLabel.text = "\(FruitStore.shared.kiwi)"
    }
    @IBAction func mangoPressed(_ sender: Any) {
        order(menu: .mangoJuice)
        mangoCountLabel.text = "\(FruitStore.shared.mango)"
    }
    
    private func order(menu: JuiceType) {
        do {
            try juiceMaker.make(juice: menu)
            getFinishedAlert(of: menu)
        } catch {
            getErrorAlert()
        }
    }
    
    private func getFinishedAlert(of juice: JuiceType) {
        let alertController = UIAlertController(
            title: "제조 성공",
            message: "\(juice.name) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        let finishedAlertAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(finishedAlertAction)
        present(alertController, animated: true)
    }
    
    private func getErrorAlert() {
        let alertController = UIAlertController(
            title: "재료 부족",
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert
        )
        let agreeAlertAction = UIAlertAction(title: "예", style: .default) { action in
            guard let fruitInventoryViewController = self.storyboard?.instantiateViewController(identifier: "FruitInventoryViewController") else {
                return
            }
            self.navigationController?.pushViewController(fruitInventoryViewController, animated: true)
        }
        let disagreeAlertAction = UIAlertAction(title: "아니오", style: .destructive)
        alertController.addAction(agreeAlertAction)
        alertController.addAction(disagreeAlertAction)
        present(alertController, animated: true)
    }
}

