//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore()

    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineApple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let strawberryQuantity = fruitStore.displayCurrentFruitInventory(fruit: "딸기") {
            strawberry.text = "\(strawberryQuantity)"
        }
            
        if let bananaQuantity = fruitStore.fruitInventory["바나나"] {
            banana.text = "\(bananaQuantity)"
        } else {
            print(fruitStoreError.errorDefault)
        }
        
        if let pineAppleQuantity = fruitStore.fruitInventory["파인애플"]  {
            pineApple.text = "\(pineAppleQuantity)"
        } else {
            print(fruitStoreError.errorDefault)
        }
        
        if let kiwiQuantity = fruitStore.fruitInventory["키위"] {
            kiwi.text = "\(kiwiQuantity)"
        }
        
        if let mangoQuantity = fruitStore.fruitInventory["망고"] {
            mango.text = "\(mangoQuantity)"
        }
    }
    
        
    @IBAction func strawBananaJuice(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .strawberryBanana)
            displaySuccessAlert(message: "\(JuiceRecipe.strawberryBanana.name)쥬스 나왔습니다")
        } catch {
            displayFailAlert()
        }
        func displaySuccessAlert(message: String) {
            let alertController = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        func displayFailAlert() {
            let alertController = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
                // '예'를 선택한 경우, segue 실행하여 화면 전환
                self?.performSegue(withIdentifier: "goToQuantityUpdate", sender: sender)
            }
            let noAction = UIAlertAction(title: "아니오", style: .cancel)
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            self.present(alertController, animated: true, completion: nil)
        }
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .strawberryBanana)
        } catch {
            print(fruitStoreError.makeJuiceError)
        }
        
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: UIButton) {
        
    }
    
    @IBAction func strawberryButton(_ sender: UIButton) {
    }
    
    @IBAction func bananaJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func pinAppleJuiceButton(_ sender: UIButton) {
    }
    @IBAction func kiwiButton(_ sender: UIButton) {
    }
    @IBAction func mangoJuiceButton(_ sender: UIButton) {
    }
    
    
    

}

