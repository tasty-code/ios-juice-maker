//
//  Alert.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import UIKit

struct Alert {
    
    static func createAlertController(alertType: AlertType, title: String?, message: String, view: UIViewController?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        switch alertType {
        case .defaultAlert:
            let okAction = UIAlertAction(title: "확인", style: .default)
            alertController.addAction(okAction)
        case .outOfStockAlert:
            let okAction = UIAlertAction(title: "예", style: .default) { _ in view?.moveToManageStockView()
            }
            let cancelAction = UIAlertAction(title: "아니오", style: .default)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
        }
        
        return alertController
    }
}
