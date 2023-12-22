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
        buttonActions: [UIAlertAction]
    ) {
        guard let currentVC = vcToShow else {
            return
        }
        let alert = AlertManager().generateAlert(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        for alertAction in buttonActions {
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
