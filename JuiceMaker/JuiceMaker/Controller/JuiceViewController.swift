//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceViewController: UIViewController {
    
    @IBOutlet var juiceEmojiBundle: [UILabel]!
    @IBOutlet var juiceStoreCountBundle: [UILabel]!
    @IBOutlet var mixJuiceOrderBundle: [UIButton]!
    @IBOutlet var singleJuiceOrderBundle: [UIButton]!
    
    @IBAction func strawBerryBananaOrder(_ sender: UIButton) {
        
    }
    @IBAction func mangoKiwiOrder(_ sender: UIButton) {
        
    }
    
    @IBAction func strawberryOrder(_ sender: UIButton) {
    }
    @IBAction func bananaOrder(_ sender: UIButton) {
    }
    @IBAction func pineAppleOrder(_ sender: UIButton) {
    }
    @IBAction func kiwiOrder(_ sender: UIButton) {
    }
    @IBAction func mangoOrder(_ sender: UIButton) {
    }
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentStockDisplay(on: juiceEmojiBundle, change: juiceStoreCountBundle)
    }
    
    func currentStockDisplay(on emojiLabels: [UILabel], change countLabels: [UILabel]) {
        for (emojiLabel, countLabel) in zip(emojiLabels, countLabels) {
            guard let checkTest = emojiLabel.text else {
                return
            }
            
            switch checkTest {
            case "🍓":
                countLabel.text = currentStock(fruitName: .strawberry)
            case "🍌":
                countLabel.text = currentStock(fruitName: .banana)
            case "🍍":
                countLabel.text = currentStock(fruitName: .pineApple)
            case "🥝":
                countLabel.text = currentStock(fruitName: .kiwi)
            case "🥭":
                countLabel.text = currentStock(fruitName: .mango)
            default:
                return
            }
        }
    }

    func currentStock(fruitName: Fruit) -> String {
        guard let fruitStock = juiceMaker.fruitStore.store[fruitName] else {
            return ""
        }
        return String(fruitStock)
    }
}

