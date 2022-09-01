//
//  Alerts.swift
//  JuiceMaker
//
//  Created by 정재근 on 2022/08/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func successMakeJuiceAlert(_ juice: JuiceMaker.Juice) {
        let alert = UIAlertController(title: "제조완료", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func failMakeJuiceAlert() {
        let alert = UIAlertController(title: "제조실패", message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .cancel) { action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let amountView = storyboard.instantiateViewController(withIdentifier: "AmountV")
            self.navigationController?.pushViewController(amountView, animated: true)
        }
        
        let noAction = UIAlertAction(title: "아니요", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
}
