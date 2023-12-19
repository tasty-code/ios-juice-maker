//
//  UIView+.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/11.
//

import UIKit

extension UIView {
    public func configureUIGradient(colors: [UIColor]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map{ $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
