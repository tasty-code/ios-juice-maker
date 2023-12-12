//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    var resultConverter: JuiceMakerResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(flavor: JuiceFlavor) {
        do {
            try consumeFruitsForMakingJuice(flavor: flavor)
            let result = JuiceMakerModel.Result(juice: flavor)
            resultConverter?.convertRestult(result)
        } catch {
            let result = JuiceMakerModel.Result(juice: nil)
            resultConverter?.convertRestult(result)
        }
    }
    
    private func consumeFruitsForMakingJuice(flavor: JuiceFlavor) throws {
        try fruitStore.consume(ingredients: flavor.recipe)
    }
}


protocol JuiceMakerResultConvertable {
    func convertRestult(_ result: JuiceMakerModel.Result)
}
