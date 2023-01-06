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
    }
    
    @IBAction func EditStockButton(_ sender: UIBarButtonItem) {
        guard let editStockVC = storyboard?.instantiateViewController(withIdentifier: "IDEditStockVC") as? EditStockVC else{ return }
        
        editStockVC.modalPresentationStyle = .automatic
        present(editStockVC, animated: true, completion: nil)
    }
}
