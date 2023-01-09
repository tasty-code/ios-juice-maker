//
//  Messages.swift
//  JuiceMaker
//
//  Created by DONGWOOK SEO on 2023/01/09.
//

import Foundation

enum Messages: String {
    case enjoyYourSelf
    
    var descripsion: String {
        switch self {
        case .enjoyYourSelf:
            return "쥬스 나왔습니다! 맛있게 드세요!"
        }
    }
}
