//
//  AlertController.swift
//  JuiceMaker
//
//  Created by Roh on 12/13/23.
//

import UIKit
struct AlertManager {
    
    static func setAlert(
        vcToShow: UIViewController?,
        preferredStyle: UIAlertController.Style = .alert,
        title: String = String(),
        message: String = String(),
        handler: [String : (() -> Void)?] = [:]
    ) {
        guard let currentVC = vcToShow else {
            return
        }
        let alert = AlertManager().generateAlert(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        
        handler.forEach { name, action in
            var alertAction: UIAlertAction
            if action != nil  {
                alertAction = UIAlertAction(title: name, style: .default) {_ in
                    action?()
                }
            } else {
                alertAction = UIAlertAction(title: name, style: .cancel)
            }
            alert.addAction(alertAction)
        }
        currentVC.present(alert, animated: true, completion: nil)
    }
    
    private func generateAlert(
        title: String,
        message: String,
        preferredStyle: UIAlertController.Style
    ) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        return alert
    }
}
