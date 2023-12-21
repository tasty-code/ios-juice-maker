//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 박찬호 on 12/7/23.
//


import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didUpdateFruitStock()
}

class SecondViewController: UIViewController {
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }


}

