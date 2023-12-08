//
//  Juice.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/5/23.
//

import Foundation

struct Juice {
    let name: String
    
    init(juiceMenu: JuiceMenu) {
        self.name = juiceMenu.name
    }
}
