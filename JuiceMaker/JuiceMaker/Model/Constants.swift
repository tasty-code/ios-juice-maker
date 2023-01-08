//
//  Constants.swift
//  JuiceMaker
//
//  Created by 김용재 on 2023/01/08.
//

import Foundation

enum Constants {
    enum Identifier {
        static let stockViewController = "StockVC"
    }
    
    enum UserMessage {
        static let servingJuiceExtra = "맛있게 드세요!"
        static let servingJuiceConfirm = "잘 먹을게요!"
        static let failedJuiceConfirm = "네"
        static let failedJuiceCancel = "아니요"
    }
    
    enum Design {
        static let stockViewControllerNavigationTitle = "과일 재고 수정"
    }
    
    enum Number {
        static let initialFruitStockQuantity = 10
    }
}
