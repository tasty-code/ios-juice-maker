//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(viewController: self)
    }
    
    @IBAction func strawberryBananaJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .strawberryBanana)
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .mangoKiwi)
    }
    
    @IBAction func strawberryJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .strawberry)
    }
    
    @IBAction func bananaJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .banana)
    }
    
    @IBAction func pineappleJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .pineapple)
    }
    
    @IBAction func kiwiJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .kiwi)
    }
    
    @IBAction func mangoJuiceButton(_ sender: Any) {
        juiceMaker?.makeJuice(to: .mango)
    }
    
}

