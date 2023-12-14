//
//  JuiceMakerLabel.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/11.
//

import UIKit

final class JuiceMakerLabel: UILabel {
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
