//
//  FruitView.swift
//  JuiceMaker
//
//  Created by sei on 2023/01/13.
//

protocol FruitView: AnyObject {
    func update(targets: [FruitComponent], with: [Fruit: Int])
    func updateLabels(of:[Fruit])
}

extension FruitView {
    func update(targets: [FruitComponent], with stocks: [Fruit: Int]) {
        let changedFruit = stocks.keys
        let fruitCompDict = targets
            .filter({changedFruit.contains($0.fruit)})
            .reduce(into: [:]){ partialResult, component in
                partialResult[component.fruit] = component
            }
        stocks.forEach { (fruit, count) in
            var component = fruitCompDict[fruit]
            component?.stock = count
        }
    }
}
