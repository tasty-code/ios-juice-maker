//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    var fruit = FruitStore()
    var juiceMaker = JuiceMaker()

    @IBOutlet var strawberryLabel: UILabel!
    @IBOutlet var bananaLabel: UILabel!
    @IBOutlet var kiwiLabel: UILabel!
    @IBOutlet var pineappleLabel: UILabel!
    @IBOutlet var mangoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func orderJuice(_ sender: UIButton) {
        var selectedJuice: Juice?
        
        switch sender.tag {
        case 0:
            selectedJuice = .strawberry
        case 1:
            selectedJuice = .banana
        case 2:
            selectedJuice = .pineapple
        case 3:
            selectedJuice = .kiwi
        case 4:
            selectedJuice = .mango
        case 5:
            selectedJuice = .strawberryBanana
        case 6:
            selectedJuice = .mangoKiwi
        default:
            return
        }
        if let selectedJuice = selectedJuice {
            juiceMaker.makeJuice(juice: selectedJuice)
        }
    }
    
    func updateFruitLabel() {
        
    }
}
