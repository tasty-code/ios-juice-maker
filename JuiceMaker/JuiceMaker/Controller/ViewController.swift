//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    private func setUI() {
        setFruitLabel()
    }
    
    private func setFruitLabel() {
        strawberryLabel.text = String(FruitStore.shared.fruits[.strawberry]?.stock ?? 0)
        bananaLabel.text = String(FruitStore.shared.fruits[.banana]?.stock ?? 0)
        pineappleLabel.text = String(FruitStore.shared.fruits[.pineapple]?.stock ?? 0)
        kiwiLabel.text = String(FruitStore.shared.fruits[.kiwi]?.stock ?? 0)
        mangoLabel.text = String(FruitStore.shared.fruits[.mango]?.stock ?? 0)
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let userSelect = Juices(rawValue: sender.tag) else { return }
        let recipe = userSelect.recipe
        do{
            try FruitStore.shared.checkStock(message: recipe)
            juiceMaker.makeJuice(by: recipe)
            popSingleChooseAlert(with: Messages.enjoyYourSelf.descripsion)
        } catch {
            popDefaultAlert(with: error.localizedDescription)
        }
        
        setFruitLabel()
    }

    private func popDefaultAlert(with message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: {_ in
            self.moveToEditStockView()}))
        alert.addAction(UIAlertAction(title: "아니오", style: .destructive, handler: nil))
        present(alert, animated: true)
    }
    
    private func popSingleChooseAlert(with message: String) {
        let alert = UIAlertController(title:  message, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func EditStockButton(_ sender: UIBarButtonItem) {
        moveToEditStockView()
    }
    
    private func moveToEditStockView(){
        guard let editStockVC = storyboard?.instantiateViewController(withIdentifier: "IDEditStockVC") as? EditStockVC else{ return }
        
        editStockVC.modalPresentationStyle = .automatic
        present(editStockVC, animated: true, completion: nil)
    }
}
