//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func ManageStockButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "viewController") as? ManageStockViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ")[0] else { return }
        print(juiceName)
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { return }
        orderJuice(juice: juice)
    }
    
    func orderJuice(juice: Juice) {
        do {
            print("재료 준비")
            try juiceMaker.orderJuice(juice: juice)
            print("\(juice.name) 주문 성공!!!")
        } catch {
            print(error)
        }
    }
}
