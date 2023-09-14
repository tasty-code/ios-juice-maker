//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private let juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manageFruitStock()
    }

    @IBAction func makeJuice(_ sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        guard let juiceName = formatButtonTextToJuiceName(buttonLabel) else { return }
        do {
            try juiceMaker.makeJuice(juiceName: juiceName)
            manageFruitStock()
        } catch let error {
            let alert = UIAlertController(title: "\(error)", message: nil, preferredStyle: .alert)
            let yes = UIAlertAction(title: "예", style: .default) { _ in
                self.moveAdjustStorageView()
            }
            let no = UIAlertAction(title: "아니오", style: .default, handler: nil)
            alert.addAction(yes)
            alert.addAction(no)
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func moveAdjustStorageView() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AdjustStockViewController") else { return }
        self.present(vc, animated: true)
    }
    
    private func manageFruitStock() {
        let inventory = juiceMaker.checkFruitStoreInventory()
        
        strawberryStockLabel.text = String(inventory["딸기"] ?? 0)
        bananaStockLabel.text = String(inventory["바나나"] ?? 0)
        kiwiStockLabel.text = String(inventory["키위"] ?? 0)
        pineappleStockLabel.text = String(inventory["파인애플"] ?? 0)
        mangoStockLabel.text = String(inventory["망고"] ?? 0)
    }
    
    private func formatButtonTextToJuiceName(_ label: String) -> String? {
        guard let juiceName = label.components(separatedBy: " ").first else { return nil }
        return juiceName
    }
}

