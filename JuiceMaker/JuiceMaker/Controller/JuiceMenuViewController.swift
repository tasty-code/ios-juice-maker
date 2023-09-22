//
//  JuiceMaker - JuiceMenuViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMenuViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private var fruitsCountLabels: [UILabel]!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = .lightGray

        for fruitType in FruitType.allCases {
            guard let fruitCount = FruitStore.shared.fruitCounts[fruitType] else {
                return
            }
            
            setFruitCountToLabel(Fruit(fruitType, fruitCount))
        }
    }
    
    @IBAction func juiceButtonPressed(_ sender: UIButton) {
        guard let juiceSubstring = sender.titleLabel?.text?.split(separator: " ")[0],
        let juiceType = JuiceType(rawValue: String(juiceSubstring)) else {
            return
        }
        order(menu: juiceType)
        for (fruitType, _) in juiceType.ingredients {
            guard let fruitCount = FruitStore.shared.fruitCounts[fruitType] else {
                return
            }
            setFruitCountToLabel(Fruit(fruitType, fruitCount))
        }
    }
    
    @IBAction func modifyInvertoryPressed(_ sender: Any) {
        guard let fruitInventoryViewController = self.storyboard?.instantiateViewController(identifier: "FruitInventoryViewController") else {
            return
        }
        let navigationController = UINavigationController(rootViewController: fruitInventoryViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    
    private func order(menu selectedMenu: JuiceType) {
        do {
            try juiceMaker.make(juice: selectedMenu)
            showAlertOrderSuccess(of: selectedMenu)
        } catch {
            showAlertOrderFailed()
        }
    }
    
    private func showAlertOrderSuccess(of juice: JuiceType) {
        let alertController = UIAlertController(
            title: "제조 성공",
            message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        let finishedAlertAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(finishedAlertAction)
        present(alertController, animated: true)
    }
    
    private func showAlertOrderFailed() {
        let alertController = UIAlertController(
            title: "재료 부족",
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert
        )
        let agreeAlertAction = UIAlertAction(title: "예", style: .default) { action in
            guard let fruitInventoryViewController = self.storyboard?.instantiateViewController(identifier: "FruitInventoryViewController") else {
                return
            }
            let navigationController = UINavigationController(rootViewController: fruitInventoryViewController)
            
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
        }
        let disagreeAlertAction = UIAlertAction(title: "아니오", style: .destructive)
        alertController.addAction(agreeAlertAction)
        alertController.addAction(disagreeAlertAction)
        present(alertController, animated: true)
    }
    
    private func setFruitCountToLabel(_ fruit: Fruit) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountLabels[fruitType.rawValue].text = String(fruitCount)
    }
}
