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
    
    let dismissAlertAction = UIAlertAction(title: "확인", style: .default)
    let acceptAlertAction = UIAlertAction(title: "예", style: .default)
    let cancelAlertAction = UIAlertAction(title: "아니오", style: .destructive)
    
    
    static func showSuccessAlert(vcToShow: UIViewController?,
                                 preferedStyle: UIAlertController.Style = .alert,
                                 title: String = "",
                                 message: String = "",
                                 completeTitle: String = "확인",
                                 completionHandler: (() -> Void)? = nil){
        guard let currentVC = vcToShow else {
            return
        }
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: preferedStyle)
        let completeAction = UIAlertAction(title: completeTitle, style: .default) { action in
            completionHandler?()
        }
        alert.addAction(completeAction)
        currentVC.present(alert, animated: true, completion: nil)
    }
    
    static func showFailAlert(vcToShow: UIViewController?,
                              preferedStyle: UIAlertController.Style = .alert,
                              title: String = "",
                              message: String = "",
                              cancelTitle: String = "취소",
                              completeTitle: String = "확인",
                              cancelHandler: (() -> Void)?,
                              completionHandler: (() -> Void)?){
        guard let currentVC = vcToShow else {
            return
        }
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: preferedStyle)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default) { action in
            cancelHandler?()
        }
        let completeAction = UIAlertAction(title: completeTitle, style: .default) { action in
            completionHandler?()
        }
        alert.addAction(cancelAction)
        alert.addAction(completeAction)
        currentVC.present(alert, animated: true, completion: nil)
    }
}
