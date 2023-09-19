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
    var transferData: [Fruit : Int] = [:]
    var delegate : SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        delegate?.recieveData(response: transferData)
        self.navigationController?.popViewController(animated: true)
    }
}
