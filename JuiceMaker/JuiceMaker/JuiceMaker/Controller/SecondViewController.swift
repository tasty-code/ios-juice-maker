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
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    weak var delegate: SecondViewControllerDelegate?
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }


}

