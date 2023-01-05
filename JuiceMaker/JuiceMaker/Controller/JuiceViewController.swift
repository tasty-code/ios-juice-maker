//
//  JuiceMaker - JuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeStockButtonTapped(_ sender: UIBarButtonItem) {
        guard let stockVC = storyboard?.instantiateViewController(withIdentifier: "StockVC") else {
            return
        }
        navigationController?.pushViewController(stockVC, animated: true)
    }
}

