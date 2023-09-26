//
//  FruitShowable.swift
//  JuiceMaker
//
//  Created by imseonghyeon on 2023/09/22.
//

import UIKit

protocol FruitShowable {}

extension FruitShowable {
    func setCount(of fruit: Fruit, on fruitsCountLabels: [UILabel]) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountLabels[fruitType.rawValue].text = "\(fruitCount)"
    }
    
    func setCount(of fruit: Fruit, on fruitsCountSteppers: [UIStepper]) {
        let (fruitType, fruitCount) = fruit
        
        fruitsCountSteppers[fruitType.rawValue].value = Double(fruitCount)
    }
    
    func setCount(on UIComponents: [UIView]...) {
        for fruitType in FruitType.allCases {
            guard let fruitCount = FruitStore.shared.fruitCounts[fruitType] else {
                return
            }
            
            for UIComponent in UIComponents {
                if let labelArray = UIComponent as? [UILabel] {
                    setCount(of: Fruit(fruitType, fruitCount), on: labelArray)
                } else if let labelArray = UIComponent as? [UIStepper] {
                    setCount(of: Fruit(fruitType, fruitCount), on: labelArray)
                }
            }
        }
    }
}
