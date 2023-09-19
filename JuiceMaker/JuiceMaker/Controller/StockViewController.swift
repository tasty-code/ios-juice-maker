//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/18.
//

import UIKit

protocol SendDataDelegate {
    func recieveData(response : [Fruit : Int])
}

class StockViewController: UIViewController {

    //받아올 데이터 저장
    var current: [Fruit : Int] = [:]
    var delegate : SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //기본 제공해주는 백버튼 숨기기
        self.navigationItem.hidesBackButton = true
        print("넘어온 데이터 : \(current)")
        current = [.strawberry : 0, .banana : 13,
            .pineapple : 19, .kiwi : 100, .mango : 11]
    }
    
    //뒤로가기 함수
    @IBAction func closeBtn(_ sender: UIButton) {
        delegate?.recieveData(response: current)
        self.navigationController?.popViewController(animated: true)
    }
    
}
