//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/02.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    init?(tag: Int) {
        switch tag {
        case 0:
            self = .strawberry
        case 1:
            self = .banana
        case 2:
            self = .pineapple
        case 3:
            self = .kiwi
        case 4:
            self = .mango
        default:
            return nil
        }
    }
}
