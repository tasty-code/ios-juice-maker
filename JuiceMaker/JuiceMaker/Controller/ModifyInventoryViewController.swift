//
//  ModifyInventoryViewController.swift
//  JuiceMaker
//
//  Created by Taewan Kim on 12/12/23.
//

import UIKit

class ModifyInventoryViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
