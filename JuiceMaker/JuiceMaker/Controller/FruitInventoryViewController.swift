//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/14.
//

import UIKit

final class FruitInventoryViewController: UIViewController {
    
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
        
        updateFruitLabels()
    }
    
    private func updateFruitLabels() {
        let fruitLabels = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel]
        
        fruitLabels.forEach { label in
            guard let tempLabel = label, let id = tempLabel.accessibilityIdentifier else {
                return
            }
            do {
                guard let fruit = try Fruit(id), let tempJuiceMaker = juiceMaker else {
                    return
                }
                let count = try tempJuiceMaker.remainingCount(fruit: fruit)
                tempLabel.text = "\(count)"
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
