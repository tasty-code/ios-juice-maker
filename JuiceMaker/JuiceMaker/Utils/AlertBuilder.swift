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
    
    init(vc: UIViewController) {
        self.viewController = vc
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

//AlertBuilder(target: self).addAction("취소", style: .default)
//        .addAction("삭제", style: .destructive) { [weak self] in
//        guard let diary = self?.diary else { return }
//        self?.delegate?.delete(diary)
//        self?.navigationController?.popViewController(animated: true)
//    }.addMessage("진짜요?", message: "정말로 삭제하시겠어요?", style: .alert)
