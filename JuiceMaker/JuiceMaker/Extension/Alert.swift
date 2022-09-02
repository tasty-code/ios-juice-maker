//
//  Alert.swift
//  JuiceMaker
//
//  Created by Schro on 2022/09/01.
//

import UIKit

class Alert: UIAlertController {
    func orderSuccessAlert(of juice: JuiceMaker.Juice) {
        let alertController = UIAlertController(title: "\(juice.name) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(ok)
    }
    
    func orderFailedAlert() {
        let alert = UIAlertController(title:"재료가 모자라요. 재고를 수정할까요?",message: "",preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: { action in
            guard let nextVC = self.navigationController?.storyboard?.instantiateViewController(withIdentifier: "ingredientChangedVC") as? ViewController else { return }
            self.present(alert, animated: true)
        })
        let cancle = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancle)
        present(alert,animated: true,completion: nil)
}
}
