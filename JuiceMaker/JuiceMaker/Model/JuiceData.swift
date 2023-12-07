//
//  JuiceData.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/07.
//

import Foundation

struct JuiceData {
    let name: JuiceType
    var quantity: Int64
    
    init(name: JuiceType, quantity: Int64) {
        self.name = name
        self.quantity = quantity
    }
}
