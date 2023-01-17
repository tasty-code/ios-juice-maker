//
//  Makable.swift
//  JuiceMaker
//
//  Created by sei on 2023/01/13.
//

protocol Ingredientable: Hashable { }

protocol Makable {
    associatedtype Ingredient: Ingredientable
    
    var recipe: [Ingredient: Int] { get }
    var ingredients: [Ingredient] { get }
}

extension Makable {
    var ingredients: [Ingredient] {
        Array(recipe.keys)
    }
}
