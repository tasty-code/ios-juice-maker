//
//  FruitView.swift
//  JuiceMaker
//
//  Created by sei on 2023/01/13.
//

import UIKit

protocol FruitView: AnyObject {
    func update(targets: [FruitComponent], with: [Fruit: Int])
    func updateLabels(of:[Fruit])
}

extension FruitView {
    func update(targets: [FruitComponent], with stockInfo: [Fruit: Int]) {
        let fruitCompDict = targets.reduce(into: [:]){ partialResult, component in
            partialResult[component.fruit] = component
        }
        stockInfo.forEach { (fruit, count) in
            var component = fruitCompDict[fruit]
            component?.stock = count
        }
    }
}