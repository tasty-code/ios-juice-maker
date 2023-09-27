//
//  FillStockAlertFactory.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/27.
//

import UIKit

struct YesOrNoAlertFactory: AlertFactoryService {
    var alertActionDelegate: YesOrNoAlertActionDelegate
    
    func build(alertData: AlertViewData) -> UIAlertController {
        let alert = UIAlertController(
            title: alertData.title,
            message: alertData.message,
            preferredStyle: alertData.style
        )
        let yesAction = UIAlertAction(
            title: alertData.okActionTitle,
            style: .default,
            handler: { _ in
                alertActionDelegate.yesAction()
            })
        let noAction = UIAlertAction(
            title: alertData.cancelActionTitle,
            style: .destructive,
            handler: { _ in
                alertActionDelegate.noAction()
            })
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        return alert
    }
}
