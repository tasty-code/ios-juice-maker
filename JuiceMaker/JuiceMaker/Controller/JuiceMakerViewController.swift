//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var inventory: [String: Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadInventory()
        self.syncStockLabels()
    }

    @IBAction func makeJuice(_ sender: UIButton) {
        guard let buttonId = sender.accessibilityIdentifier else { return }
        
        do {
            try juiceMaker.makeJuice(juiceName: buttonId)
            self.loadInventory()
            self.syncStockLabels()
            showAlertCompletionJuiceMaking(buttonId)
        } catch let error {
            showAlertOutOfStock(error)
        }
    }
    
    @IBAction func touchNavButton(_ sender: UIBarButtonItem) {
        pushAdjustStockViewController()
    }
}

// MARK: Delegate
extension JuiceMakerViewController: InventorySendDelegate {
    func sendInventory(inventory: [String: Int]) {
        self.inventory = inventory
        syncStockLabels()
        juiceMaker.updateFruitStoreInventory(with: inventory)
    }
}

// MARK: Private Methods
extension JuiceMakerViewController {
    private func loadInventory() {
        self.inventory = juiceMaker.checkFruitStoreInventory()
    }
    
    private func syncStockLabels() {
        strawberryStockLabel.text = String(inventory?["딸기"] ?? 0)
        bananaStockLabel.text = String(inventory?["바나나"] ?? 0)
        kiwiStockLabel.text = String(inventory?["키위"] ?? 0)
        pineappleStockLabel.text = String(inventory?["파인애플"] ?? 0)
        mangoStockLabel.text = String(inventory?["망고"] ?? 0)
    }
    
    private func showAlertCompletionJuiceMaking(_ juiceName: String) {
        let alert = UIAlertController(title: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "감사합니다!", style: .default)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlertOutOfStock(_ error: Error) {
        let alert = UIAlertController(title: "\(error)", message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "예", style: .default) { _ in
            self.pushAdjustStockViewController()
        }
        let no = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
    }
    
    private func pushAdjustStockViewController() {
        guard let adjustStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "AdjustStockViewController") as? AdjustStockViewController
        else { return }
        
        adjustStockViewController.inventory = self.inventory
        adjustStockViewController.delegate = self
        self.navigationController?.pushViewController(adjustStockViewController, animated: true)
    }
}
