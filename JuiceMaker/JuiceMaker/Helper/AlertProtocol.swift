//
//  AlertCase.swift
//  JuiceMaker
//
//  Created by 권태호 on 11/12/2023.
//

import UIKit

protocol AlertPresentable: UIViewController {
    func showSuccessAlert(message:String)
    func showFailAlert()
}
extension AlertPresentable {
    func showSuccessAlert(message: String) {
        let alertController = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showFailAlert() {
        let alerContoroller = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [self] _ in
            performSegue(withIdentifier: "goToQuantityUpdate", sender: self)
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        alerContoroller.addAction(yesAction)
        alerContoroller.addAction(noAction)
        present(alerContoroller, animated: true)
    }
}








