//
//  JuiceData.swift
//  JuiceMaker
//
//  Created by 둘리 on 2023/12/07.
//

import UIKit

struct JuiceInfo {
    let name: Juice
    var quantity: Int
    
    init(name: Juice, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
}
