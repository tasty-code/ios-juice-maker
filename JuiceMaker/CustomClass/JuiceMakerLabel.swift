//
//  JuiceMakerLabel.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/11.
//

import Foundation
import UIKit

class JuiceMakerLabel: UILabel {
    init() {
        super.init(frame: .zero)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    func configUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
