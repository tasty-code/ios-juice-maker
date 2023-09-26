//
//  UIViewController+Extension.swift
//  JuiceMaker
//
//  Created by 김준성 on 2023/09/26.
//

import UIKit

extension UIViewController {
    func setNavigationBarBackgroundColor(_ color: UIColor = .navigationBarColor) {
        navigationController?.navigationBar.backgroundColor = color
    }
}
