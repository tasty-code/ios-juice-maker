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
        preferedStyle: UIAlertController.Style = .alert,
        title: String = String(),
        message: String = String(),
        buttonActions: [UIAlertAction]
    ) {
        guard let currentVC = vcToShow else {
            return
        }
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferedStyle
        )
        for alertAction in buttonActions {
            alert.addAction(alertAction)
        }
        currentVC.present(alert, animated: true, completion: nil)
    }
}
