//
//  UIViewController + Extension.swift
//  JuiceMaker
//
//  Created by EUNJU on 2023/12/05.
//

import UIKit

extension UIViewController {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

extension UIViewController {
    
    /// 확인 버튼 하나만 있는 Alert 메서드
    func presentAlert(title: String,
                      message: String,
                      confirmTitle: String,
                      confirmAction: ((UIAlertAction) -> Void)? = nil,
                      completion: (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default)
        alertViewController.addAction(confirmAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    /// 확인, 취소 버튼이 있는 Alert 메서드
    func presentAlertWithCancel(title: String,
                                message: String,
                                confirmTitle: String,
                                cancelTitle: String,
                                confirmAction: ((UIAlertAction) -> Void)? = nil,
                                cancelAction: ((UIAlertAction) -> Void)? = nil,
                                completion: (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: confirmAction)
        alertViewController.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
