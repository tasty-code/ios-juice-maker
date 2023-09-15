//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/14.
//

import UIKit

class FruitInventoryViewController: UIViewController {
    
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initIdentifier()
    }
    
    private func initIdentifier() {
        strawberryLabel.accessibilityIdentifier = "딸기"
        bananaLabel.accessibilityIdentifier = "바나나"
        pineappleLabel.accessibilityIdentifier = "파인애플"
        kiwiLabel.accessibilityIdentifier = "키위"
        mangoLabel.accessibilityIdentifier = "망고"
        
        remainFruit()
    }
    
    private func remainFruit() {
        let labelArray: [UILabel] = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel]
        
        labelArray.forEach { label in
            guard let id = label.accessibilityIdentifier else { return }
            
            do {
                guard let tempJuiceMaker = juiceMaker else { return }
                let fruit = try Fruit.identifyFruit(labelIdentifier: id)
                let count = try tempJuiceMaker.remainingCount(fruit: fruit)
                label.text = "\(count)"
            } catch {
                defaultAlert(message: InventoryError.invalidError.description)
            }
        }
    }
}

extension FruitInventoryViewController {
    private func defaultAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yes = UIAlertAction(title: "예", style: .default)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
}
