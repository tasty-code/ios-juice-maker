//
//  CustomButton.swift
//  JuiceMaker
//
//  Created by 박찬호 on 12/19/23.
//

import UIKit

class CustomButton: UIButton {
    let padding: CGFloat = 10

    override func awakeFromNib() {
        super.awakeFromNib()

        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5

        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
}

