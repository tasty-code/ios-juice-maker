//
//  Alert.swift
//  JuiceMaker
//
//  Copyright © 유니 & 이안. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, alertButton: Bool, action: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if alertButton {
            alertController.addAction(UIAlertAction(title: "아니오", style: .destructive, handler: nil))
            alertController.addAction(UIAlertAction(title: "예", style: .default, handler: action))
        } else {
            alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        }
        self.present(alertController, animated: true)
    }
}
