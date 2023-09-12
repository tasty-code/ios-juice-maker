//
//  Singleton.swift
//  JuiceMaker
//
//  Created by 김수경 on 2023/09/12.
//

import Foundation

class Singleton {
    static var shared = Singleton()
    var seSac = "🌱"
    
    private init() {}
}

let test = Singleton.shared
let changed = Singleton.shared

