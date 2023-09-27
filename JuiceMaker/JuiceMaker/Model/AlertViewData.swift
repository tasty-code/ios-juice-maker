//
//  AlertViewData.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/27.
//

import UIKit

struct AlertViewData {
    var title: String
    var message: String
    var style: UIAlertController.Style
    var okActionTitle: String
    var cancelActionTitle: String?
        
    init(title: String, message: String, style: UIAlertController.Style, okActionTitle: String, cancelActionTitle: String?) {
        self.title = title
        self.message = message
        self.style = style
        self.okActionTitle = okActionTitle
        self.cancelActionTitle = cancelActionTitle
    }
}
