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
    
    /// 확인 버튼 Alert 메서드
    func makeAlert(title: String, message: String, confirmTitle: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default)
        alertViewController.addAction(confirmAction)
        self.present(alertViewController, animated: true)
    }
}
