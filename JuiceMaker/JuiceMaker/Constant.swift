//
//  Constant.swift
//  JuiceMaker
//
//  Created by sei on 2023/01/13.
//

enum ViewController {
    static let storeNavi = "storeNavi"
    static let store = "storeView"
}

enum Alert {
    enum Message {
        static let emptyStock = "재고가 모자라요. 재고를 수정할까요?"
        static func done(_ juice: FruitJuice) -> String {
            return "\(juice) 나왔습니다! 맛있게 드세요!"
        }
    }
    enum ButtonTitle {
        static let yes = "예"
        static let no = "아니오"
        static let confirm = "확인"
    }
}

enum FruitStock {
    static let initial = 10
}
