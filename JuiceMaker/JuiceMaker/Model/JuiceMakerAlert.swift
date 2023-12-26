//
//  JuiceMakerAlert.swift
//  JuiceMaker
//
//  Created by 강창현 on 12/17/23.
//

import UIKit

protocol JuiceMakerAlert {
    func showJuiceMakerAlert(message: String, actions: [UIAlertAction])
}

extension JuiceMakerAlert where Self: UIViewController {
    func showJuiceMakerAlert(message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: "알림",
                                      message: message,
                                      preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        self.present(alert, animated: true)
    }
}
