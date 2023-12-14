//
//  Alert.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import UIKit

struct Alert {
    static func createAlert(title: String? = nil, message: String? = nil, okTitle: String, okAction: @escaping () -> Void) -> UIAlertController {
        let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default) { _ in okAction() }
        vc.addAction(okAction)
        return vc
    }
}
