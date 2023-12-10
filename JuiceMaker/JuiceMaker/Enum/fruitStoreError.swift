//
//  CustomError.swift
//  JuiceMaker
//
//  Created by 권태호 on 06/12/2023.
//

import Foundation


enum fruitStoreError: Error {
    case fruitUpdateError (message: String)
    case makeJuiceError (message: String)
    case errorDefault (message: String)
}


