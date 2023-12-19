//
//  Delegate.swift
//  JuiceMaker
//
//  Created by 미르 & 미성
//

import Foundation

protocol Delegate {
    func fruitStock(fruitStock: [Fruit: UInt])
    func viewWillAppear(_ animated: Bool)
}
