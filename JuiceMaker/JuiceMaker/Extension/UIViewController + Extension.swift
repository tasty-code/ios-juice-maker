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
    func presentInventoryAlert(title: String, message: String, confirmTitle: String, cancelTitle: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: { _ in
            guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                    as? UIViewController else { return }
            
            self.navigationController?.pushViewController(nextViewController, animated: true)
        })
        alertViewController.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true)
    }
    
    func presentMakingJuiceAlert(title: String, message: String, confirmTitle: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default)
        alertViewController.addAction(confirmAction)
        
        self.present(alertViewController, animated: true)
    }
}
