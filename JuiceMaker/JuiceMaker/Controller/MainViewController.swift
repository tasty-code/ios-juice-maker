//
//  JuiceMaker - ViewController.swift
//  Created by 미르 & 미성
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFruitsStock()
    }


    @IBAction func manageStockButton(_ sender: UIButton) {
        moveToManageStockView()
    }
    
    @IBAction func checkJuiceOrder(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ")[0] else { return }
        print(juiceName)
        guard let juice = juiceMaker.checkJuiceRecipe(juiceName: juiceName) else { return }
        orderJuice(juice: juice)
    }
    
    func moveToManageStockView() {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "viewController") as? ManageStockViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func orderJuice(juice: Juice) {
        do {
            try juiceMaker.orderJuice(juice: juice)
            showSuccessAlert(juiceName: juice.name)
            checkFruitsStock()
        } catch {
            showOutOfStockAlert()
        }
    }
    
    func checkFruitsStock() {
        strawberryLabel.text = String(juiceMaker.fruitStore.fruitStock[.strawberry] ?? 0)
        bananaLabel.text = String(juiceMaker.fruitStore.fruitStock[.banana] ?? 0)
        pineappleLabel.text = String(juiceMaker.fruitStore.fruitStock[.pineapple] ?? 0)
        kiwiLabel.text = String(juiceMaker.fruitStore.fruitStock[.kiwi] ?? 0)
        mangoLabel.text = String(juiceMaker.fruitStore.fruitStock[.mango] ?? 0)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.moveToManageStockView()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showSuccessAlert(juiceName: String) {
        let alert = UIAlertController(title: nil, message: "\(juiceName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
