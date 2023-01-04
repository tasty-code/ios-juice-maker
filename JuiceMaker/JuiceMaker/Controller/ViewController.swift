//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        test()
    }

    func test() {
        
        var storeTest = FruitStore(defaultStock: 10)
        var makerTest = JuiceMaker(fruitStore: storeTest)
        do {
            let juice = try makerTest.make(juice: .strawberryJuice)
            print(juice)
        } catch {
            print(error)
        }
       
    }

}

