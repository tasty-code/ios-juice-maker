//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fruitStore: FruitStore = FruitStore()
    lazy var juiceMaker: JuiceMaker = JuiceMaker(store: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.initializeFruit()
    }
    
    @IBAction func juiceMakeBtnTapped(_ choice: UIButton) {
        switch choice.tag {
        case 0:
            print("button 0 press")
        case 1:
            print("button 1 press")
        case 2:
            print("button 2 press")
        case 3:
            print("button 3 press")
        case 4:
            print("button 4 press")
        case 5:
            print("button 5 press")
        case 6:
            print("button 6 press")
        default:
            break
        }
    }
}

