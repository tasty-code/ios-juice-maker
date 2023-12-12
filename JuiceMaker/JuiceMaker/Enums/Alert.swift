//
//  Alert.swift
//  JuiceMaker
//
//  Created by 장우석 on 12/12/23.
//

import UIKit

enum Alert {
    case juiceSucess(Juice)
    case juiceFail(() -> ())
}

extension Alert {
    var modal: UIAlertController {
        switch self {
        case .juiceSucess(let juice):
            let alertController = UIAlertController(title: "알림", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(yes)
            return alertController
        case .juiceFail(let handler):
            let alertController = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "예", style: .default, handler: { _ in handler() })
            let no = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
            alertController.addAction(yes)
            alertController.addAction(no)
            return alertController
        }
    }
}
