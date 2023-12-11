//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnJuiceOrder(_ choice: UIButton) {
        print(choice.tag)
    }
    @IBAction func btnMoveStore(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreViewController")

        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
}

