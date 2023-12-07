//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func ManageStockButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "viewController") as? ManageStockViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

