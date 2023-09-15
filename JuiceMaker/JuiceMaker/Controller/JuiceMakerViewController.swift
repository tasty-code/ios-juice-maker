//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    var juiceMaker: JuiceMaker = JuiceMaker(fruitStore: FruitStore(fruitList:[
        FruitStore.Fruit(name: "딸기"),
        FruitStore.Fruit(name: "바나나"),
        FruitStore.Fruit(name: "파인애플"),
        FruitStore.Fruit(name: "키위"),
        FruitStore.Fruit(name: "망고")]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let fruitStoreViewController = segue.destination as? FruitStoreViewController else {
            print("\(segue.destination)")
            return}
        fruitStoreViewController.fruitStore = juiceMaker.fruitStore
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    @IBOutlet weak var strawberryQantityLabel: UILabel!
    
    @IBOutlet weak var bananaQantityLabel: UILabel!
    
    @IBOutlet weak var pineappleQantityLabel: UILabel!
    
    @IBOutlet weak var kiwiQantityLabel: UILabel!
    
    @IBOutlet weak var mangoQuatityLabel: UILabel!
    
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juiceName = sender.currentTitle?.split(separator: " ").filter({ $0 != "주문" }).joined() else { return }
        do {
            try juiceMaker.startOrder(juiceName: juiceName)
            showingCompletedOrderAlert(juiceName: juiceName)
            updateUI()
        } catch {
            showingOutOfStockAlert(error: error)
        }
        
    }
}



//MARK: - Method
extension JuiceMakerViewController {
    
    private func updateUI() {
        strawberryQantityLabel.text = String(juiceMaker.fruitStore.fruitList[0].stock)
        bananaQantityLabel.text = String(juiceMaker.fruitStore.fruitList[1].stock)
        pineappleQantityLabel.text = String(juiceMaker.fruitStore.fruitList[2].stock)
        kiwiQantityLabel.text = String(juiceMaker.fruitStore.fruitList[3].stock)
        mangoQuatityLabel.text = String(juiceMaker.fruitStore.fruitList[4].stock)
    }
    
    
    private func showingOutOfStockAlert(error: Error) {
        let outOfStockAlert = UIAlertController(title: nil, message: "\(error)", preferredStyle: .alert)
        
        let moveToFruitStore = UIAlertAction(title: "이동하기", style: .destructive) { _ in
            guard let fruitStoreViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? FruitStoreViewController else { return }
            guard let navigationController = self.navigationController else { return }
            fruitStoreViewController.fruitStore = self.juiceMaker.fruitStore
            
            navigationController.pushViewController(fruitStoreViewController, animated: true)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        outOfStockAlert.addAction(moveToFruitStore)
        outOfStockAlert.addAction(cancel)
        
        present(outOfStockAlert, animated: true)
        
        
    }
    
    private func showingCompletedOrderAlert(juiceName: String) {
        let completedOrderAlert =  UIAlertController(title: nil, message: MessageLog.AlertCase.sucess(juiceName: juiceName).message, preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "확인", style: .default)
        
        completedOrderAlert.addAction(okay)
        
        
        present(completedOrderAlert, animated: true)
    }
}

