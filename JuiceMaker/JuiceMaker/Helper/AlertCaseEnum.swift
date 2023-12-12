//
//  AlertCase.swift
//  JuiceMaker
//
//  Created by 권태호 on 11/12/2023.
//

import UIKit

// 클레스를 만들고
//


class Alert {
    
    func success() {
        func displaySuccessAlert(message: String) {
            let alertController = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
        }
        
        func displayFailAlert() {
            let alertController = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
                
            }
            let noAction = UIAlertAction(title: "아니오", style: .cancel)
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            
        }
    }
}

