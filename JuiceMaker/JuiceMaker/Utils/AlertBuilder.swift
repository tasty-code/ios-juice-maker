//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Created by 이주상 on 12/14/23.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let completion: (() -> Void)?
}

final class AlertBuilder {
    private weak var viewController: UIViewController?
    private var alertActions: [AlertAction] = []
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func addAction(_ title: String, style: UIAlertAction.Style, action: (() -> Void)? = nil) -> Self {
        let alertAction = AlertAction(title: title, style: style, completion: action)
        alertActions.append(alertAction)
        
        return self
    }
    
    func addMessage(title: String? = nil, message: String? = nil, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertActions.forEach { action in
            let alertAction = UIAlertAction(title: action.title, style: action.style) { _ in
                action.completion?()
            }
            alertController.addAction(alertAction)
        }
        viewController?.present(alertController, animated: true)
    }
}
