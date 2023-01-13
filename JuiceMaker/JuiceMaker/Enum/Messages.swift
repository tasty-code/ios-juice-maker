//
//  Messages.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/09.
//

import Foundation

enum Messages: String {
    case orderSuccess
}

extension Messages {
    var descripsion: String {
        switch self {
        case .orderSuccess:
            return " 나왔습니다! 맛있게 드세요!"
        }
    }
}
