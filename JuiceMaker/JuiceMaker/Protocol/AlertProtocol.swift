//
//  AlertCase.swift
//  JuiceMaker
//
//  Created by 권태호 on 11/12/2023.
//

import UIKit

protocol AlertPresentable {
    var alertFruitStore:FruitStore? { get }
    func showSuccessAlert(message: String)
    func showFailAlert()
}

extension AlertPresentable where Self: UIViewController {
    func showSuccessAlert(message: String) {
        let alertController = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func showQuantityVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let quantityVC = storyboard.instantiateViewController(withIdentifier: "quantityVC") as? QuantityViewController {
            quantityVC.fruitStore = self.alertFruitStore
            navigationController?.pushViewController(quantityVC, animated: true)
        }
    }
    
    func showFailAlert() {
        let alertController = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [unowned self] _ in
            self.showQuantityVC()
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        present(alertController, animated: true)
    }
}



