//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    let juiceMaker: JuiceMaker = JuiceMaker(fruitStore: FruitStore(fruitList:[
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
        do {
            try updateUI()
        } catch {
            print("\(error)")
        }
    }
    
    @IBOutlet weak var strawberryQantityLabel: UILabel!
    
    @IBOutlet weak var bananaQantityLabel: UILabel!
    
    @IBOutlet weak var pineappleQantityLabel: UILabel!
    
    @IBOutlet weak var kiwiQantityLabel: UILabel!
    
    @IBOutlet weak var mangoQuatityLabel: UILabel!
    
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juiceTag = JuiceMaker.Recipe(rawValue: sender.tag)  else { return }
        do {
            try juiceMaker.startOrder(juiceTag: juiceTag.rawValue)
            showingCompletedOrderAlert(juiceName: juiceTag.juiceName)
            try updateUI()
        } catch {
            showingOutOfStockAlert(error: error)
        }
        
    }
}



//MARK: - Method
extension JuiceMakerViewController {
    
    private func updateUI() throws{
        
        strawberryQantityLabel.text = String(try juiceMaker.fruitStore.takeFruitStock(fruitName:"딸기"))
        bananaQantityLabel.text = String(try juiceMaker.fruitStore.takeFruitStock(fruitName:"바나나"))
        pineappleQantityLabel.text = String(try juiceMaker.fruitStore.takeFruitStock(fruitName:"파인애플"))
        kiwiQantityLabel.text = String(try juiceMaker.fruitStore.takeFruitStock(fruitName:"키위"))
        mangoQuatityLabel.text = String(try juiceMaker.fruitStore.takeFruitStock(fruitName:"망고"))

        
    }
    
    
    private func showingOutOfStockAlert(error: Error) {
        let outOfStockAlert = UIAlertController(title: nil, message: "\(error)", preferredStyle: .alert)
        
        let moveToFruitStore = UIAlertAction(title: "이동하기", style: .destructive) { _ in
            guard let fruitStoreViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? FruitStoreViewController else { return }
            guard let navigationController = self.navigationController else { return }
            fruitStoreViewController.fruitStore = self.juiceMaker.fruitStore
            
            navigationController.pushViewController(fruitStoreViewController, animated: true)
        }
        
        let dismissAction = UIAlertAction(title: "취소", style: .cancel)
        
        outOfStockAlert.addAction(moveToFruitStore)
        outOfStockAlert.addAction(dismissAction)
        
        present(outOfStockAlert, animated: true)
        
        
    }
    
    private func showingCompletedOrderAlert(juiceName: String) {
        let completedOrderAlert =  UIAlertController(title: nil, message: "\(MessageLog.AlertCase.sucess(juiceName: juiceName))", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        
        completedOrderAlert.addAction(confirmAction)
        
        
        present(completedOrderAlert, animated: true)
    }
}

