//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapEditInventoryButton(_ sender: UIBarButtonItem) {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

