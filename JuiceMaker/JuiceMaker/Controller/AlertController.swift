//
//  AlertController.swift
//  JuiceMaker
//
//  Created by Roh on 12/13/23.
//

import UIKit

struct AlertController {
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
