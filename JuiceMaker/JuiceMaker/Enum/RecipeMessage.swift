//
//  RecipeMessage.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/03.
//

import Foundation

enum RecipeMessage: String {
    case strawberryJuice = "Sb16"
    case bananaJuice = "Bn2"
    case kiwiJuice = "Kw3"
    case pineappleJuice = "Pa2"
    case strawBananaJuice = "Sb10+Bn1"
    case mangoJuice = "Mg3"
    case mangoKiwiJuice = "Mg2+Kw1"
    
    static func translate(recipeMessage :String) -> [OrderMessage] {
        
        var convertedString: [OrderMessage] = []
        
        let splitedString = recipeMessage.split(separator: "+")
        splitedString.forEach{
            let fruitCode = String($0.prefix(2))
            let amountStartIndex = $0.index($0.startIndex, offsetBy: 2)
            let amountCode = Int($0[amountStartIndex...]) ?? 0
            
            convertedString.append(OrderMessage(fruitName: fruitCode, amount: amountCode))
        }
        
        return convertedString
    }
    
}
