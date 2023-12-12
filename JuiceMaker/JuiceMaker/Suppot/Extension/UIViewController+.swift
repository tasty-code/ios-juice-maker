//
//  UIViewController++.swift
//  JuiceMaker
//
//  Created by Matthew on 12/12/23.
//

import UIKit

extension UIViewController {
    public func makeCompletedAlert(title: String,
                                   message: String,
                                   okAction: ((UIAlertAction) -> ())? = nil,
                                   completion: (() -> ())? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
    
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    public func makeFailedAlert(title: String,
                                message: String,
                                okAction: ((UIAlertAction) -> ())? = nil,
                                cancelAction: ((UIAlertAction) -> ())? = nil,
                                completion: (() -> ())? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "재고수정", style: .default, handler: okAction)
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: cancelAction)
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
