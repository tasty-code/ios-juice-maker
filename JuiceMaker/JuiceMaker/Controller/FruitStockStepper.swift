//
//  FruitStockStepper.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/19/23.
//

import UIKit

class FruitStockStepper: UIStepper {
    
    var tappedSign: Sign = .none
    var oldValue: Double = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setAddTarget()
    }
    
    private func setAddTarget() {
        addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    @objc private func valueChanged() {
        tappedSign = value > oldValue ? .plus : .minus
        oldValue = value
    }
}
