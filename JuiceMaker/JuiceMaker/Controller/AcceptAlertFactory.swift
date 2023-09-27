//
//  AlertFactory.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/27.
//

import UIKit

struct AcceptAlertFactory: AlertFactoryService {
    var alertActionDelegate: AceeptAlertActionDelegate
    
    func build(alertData: AlertViewData) -> UIAlertController {
        let alert = UIAlertController(
            title: alertData.title,
            message: alertData.message,
            preferredStyle: alertData.style
        )
        let okAction = UIAlertAction(
            title: alertData.okActionTitle,
            style: .default,
            handler: { _ in
                alertActionDelegate.okAction()
            })
        alert.addAction(okAction)
        
        return alert
    }
    
}
