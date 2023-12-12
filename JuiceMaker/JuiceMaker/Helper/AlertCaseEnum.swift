//
//  AlertCase.swift
//  JuiceMaker
//
//  Created by 권태호 on 11/12/2023.
//

import UIKit

// 클레스를 만들고
//


//ViewContoroller에서 Alert을 호출하게 구현하고 싶음
class Alert: UIAlertController {
    
    func displaySuccessAlert(message: String) {
        let alertController = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func displayFailAlert() {
        let alertController = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) {_ in
            self.performSegue(withIdentifier: "goToQuantityUpdate", sender: self)
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        present(alertController, animated: true)
    }
}
