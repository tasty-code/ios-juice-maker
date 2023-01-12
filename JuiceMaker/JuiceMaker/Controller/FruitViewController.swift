//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/11.
//

import UIKit

class FruitViewController: UIViewController {
    
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBOutlet var fruitEmojiBundle: [UILabel]!
    @IBOutlet var fruitStoreCountBundle: [UILabel]!
    @IBOutlet var stepperBundle: [UIStepper]!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
