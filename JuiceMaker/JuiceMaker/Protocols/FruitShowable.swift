//
//  FruitShowable.swift
//  JuiceMaker
//
//  Created by imseonghyeon on 2023/09/22.
//

import UIKit

protocol FruitShowable {
}

extension FruitShowable {
    func show(_ fruit: Fruit, on fruitsCountLabels: [UILabel]) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountLabels[fruitType.rawValue].text = "\(fruitCount)"
    }
    
    func show(_ fruit: Fruit, on fruitsCountSteppers: [UIStepper]) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountSteppers[fruitType.rawValue].value = Double(fruitCount)
    }
}
