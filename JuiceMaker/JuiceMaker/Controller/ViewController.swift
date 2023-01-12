//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigure()
    }
    override func viewWillAppear(_ animated: Bool) {
        setFruitLabel()
    }
    private func setConfigure() {
        setFruitLabel()
    }
    
    private func setFruitLabel() {
        for fruitStockLabel in fruitStockLabels {
            guard let label = fruitStockLabel as? FruitStockManagable,
                  let stockInt = FruitStore.shared.fruits[label.fruitName]?.stock else { return }
            let changeStockIntToString = String(stockInt)
            fruitStockLabel.text = changeStockIntToString
        }
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let userSelect = Juices(rawValue: sender.tag) else { return }
        guard let buttoneCallName = sender.titleLabel?.text else { return }
        
        let orderedJuiceName = buttoneCallName.replacingOccurrences(of: " 주문", with: "")
        let recipe = userSelect.recipe
        do{
            try FruitStore.shared.checkStock(message: recipe)
            juiceMaker.makeJuice(by: recipe)
            popAlert(with: orderedJuiceName + Messages.orderSuccess.descripsion, error: nil)
        } catch {
            popAlert(with: nil, error: error)
        }
        setFruitLabel()
    }
    
    private func popAlert(with message: String?, error: Error?) {
        if message != nil && error != nil { return }
        
        if let message {
            let alert = UIAlertController(title:  message, message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
            present(alert, animated: true)
        }
        if let error {
            let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: {_ in
                self.moveToEditStockView()}))
            alert.addAction(UIAlertAction(title: "아니오", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
    }
    
    
    
    @IBAction func EditStockButton(_ sender: UIBarButtonItem) {
        moveToEditStockView()
    }
    
    private func moveToEditStockView(){
        guard let editStockVC = storyboard?.instantiateViewController(withIdentifier: "IDEditStockVC") as? EditStockVC else{ return }
        
        editStockVC.modalPresentationStyle = .fullScreen
        present(editStockVC, animated: true, completion: nil)
    }
}
