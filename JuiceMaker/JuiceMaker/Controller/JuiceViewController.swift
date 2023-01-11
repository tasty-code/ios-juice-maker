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
        
        currentStockDisplay(label: juiceStoreCountBundle)
    }
    
    func currentStockDisplay(label: [UILabel]) {
        label.forEach { fruitLabel in
            switch fruitLabel.text {
            case "🍓":
                label[0].text = currentStock(fruitName: .strawberry)
            case "🍌":
                label[1].text = currentStock(fruitName: .banana)
            case "🍍":
                label[2].text = currentStock(fruitName: .pineApple)
            case "🥝":
                label[3].text = currentStock(fruitName: .kiwi)
            case "🥭":
                label[4].text = currentStock(fruitName: .mango)
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

