//
//  JuiceMakerAlert.swift
//  JuiceMaker
//
//  Created by 강창현 on 12/17/23.
//

import UIKit

protocol JuiceMakerAlert {
    func showJuiceMakerAlert(isCompletedMakeJuice: Bool, message: String, completion: (() -> Void)?)
}

extension JuiceMakerAlert where Self: UIViewController {
    func showJuiceMakerAlert(isCompletedMakeJuice: Bool, message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: "알림" , message: message, preferredStyle: .alert)
        guard
            isCompletedMakeJuice
        else {
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
                print("핸들러 시작")
                completion?()
                print("핸들러 끝")
            }))
            alert.addAction(UIAlertAction(title: "아니요", style: .cancel))
            self.present(alert, animated: true)
            print("guard문 끝")
            return print("showJuiceMakerAlert: 함수 끝")
        }
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: true)
        print("showJuiceMakerAlert: 함수 끝")
    }
}
