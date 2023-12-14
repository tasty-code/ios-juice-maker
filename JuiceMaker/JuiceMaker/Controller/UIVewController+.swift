//
//  UIVewController+.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/14/23.
//

import UIKit

extension UIViewController {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    func makeRequestAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)?,
                   cancelAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)

        self.present(alertViewController, animated: true, completion: completion)
    }
    
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
       
        self.present(alertViewController, animated: true, completion: completion)
    }
}
