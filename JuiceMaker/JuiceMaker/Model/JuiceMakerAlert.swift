//
//  JuiceMakerAlert.swift
//  JuiceMaker
//
//  Created by 강창현 on 12/17/23.
//

import UIKit

protocol JuiceMakerAlert {
    func showJuiceMakerAlert(viewController: UIViewController, isCompletedMakeJucie: Bool, message: String)
}

extension JuiceMakerAlert {
    func showJuiceMakerAlert(viewController: UIViewController, isCompletedMakeJucie: Bool, message: String) {
        let alert = UIAlertController(title: "알림" , message: message, preferredStyle: .alert)
        guard
            isCompletedMakeJucie
        else {
            let juiceMakerViewController = JuiceMakerViewController()
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
                print("누름")
                juiceMakerViewController.showFruitStoreViewController()
                print("누름")
            }))
            alert.addAction(UIAlertAction(title: "아니요", style: .cancel))
            viewController.present(alert, animated: true)
            return
        }
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        viewController.present(alert, animated: true)
    }
}
