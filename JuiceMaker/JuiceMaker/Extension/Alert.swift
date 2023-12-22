//
//  Alert.swift
//  JuiceMaker
//
//  Copyright © 유니 & 이안. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertWithConfirmation(title: String, message: String, confirmationAction: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "예", style: .default, handler: confirmationAction))
        self.present(alertController, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alertController, animated: true)
    }
}
