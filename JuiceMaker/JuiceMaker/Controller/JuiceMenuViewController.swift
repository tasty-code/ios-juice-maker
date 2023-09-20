//
//  JuiceMaker - JuiceMenuViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMenuViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for fruitType in FruitType.allCases {
            guard let fruitCount = FruitStore.shared.fruitCountList[fruitType] else {
                return
            }
            
            switch fruitType {
            case .strawberry:
                strawberryCountLabel.text = "\(fruitCount)"
            case .banana:
                bananaCountLabel.text = "\(fruitCount)"
            case .pineapple:
                pineappleCountLabel.text = "\(fruitCount)"
            case .kiwi:
                kiwiCountLabel.text = "\(fruitCount)"
            case .mango:
                mangoCountLabel.text = "\(fruitCount)"
            }
        }
    }
    
    @IBAction func juiceButtonPressed(_ sender: UIButton) {
        guard let juiceSubstring = sender.titleLabel?.text?.split(separator: " ")[0],
        let juiceType = JuiceType(rawValue: String(juiceSubstring)) else {
            return
        }
        order(menu: juiceType)
        for (fruitType, _) in juiceType.ingredients {
            var fruitCount = 0
            if let tempCount = FruitStore.shared.fruitCountList[fruitType] {
                fruitCount = tempCount
            }
            switch fruitType {
            case .strawberry:
                strawberryCountLabel.text = "\(fruitCount)"
            case .banana:
                bananaCountLabel.text = "\(fruitCount)"
            case .mango:
                mangoCountLabel.text = "\(fruitCount)"
            case .pineapple:
                pineappleCountLabel.text = "\(fruitCount)"
            case .kiwi:
                kiwiCountLabel.text = "\(fruitCount)"
            }
        }
    }
    
    private func order(menu selectedMenu: JuiceType) {
        do {
            try juiceMaker.make(juice: selectedMenu)
            alertOrderSuccess(of: selectedMenu)
        } catch {
            alertOrderFailed()
        }
    }
    
    private func alertOrderSuccess(of juice: JuiceType) {
        let alertController = UIAlertController(
            title: "제조 성공",
            message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        let finishedAlertAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(finishedAlertAction)
        present(alertController, animated: true)
    }
    
    private func alertOrderFailed() {
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

