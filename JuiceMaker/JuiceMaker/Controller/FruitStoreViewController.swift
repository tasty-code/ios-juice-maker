//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 최승범 on 2023/09/14.
//

import UIKit

class FruitStoreViewController: UIViewController {
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
   
    @IBOutlet weak var storeStrawberryLabel: UILabel!
    
    @IBAction func backToJuiceMakerView(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    private func updateUI() {
        guard let fruitStore = fruitStore else { return }
        storeStrawberryLabel.text = String(fruitStore.fruitList[0].stock)
    }
}
