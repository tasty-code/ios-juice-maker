//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fruitStore = FruitStore.shared

    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineApple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    func displaySuccessAlert(message: String) {
        let alertController = UIAlertController(title: "쥬스 완성", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func displayFailAlert() {
        let alertController = UIAlertController(title: "재료가 모자라요", message: "재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "goToQuantityUpdate", sender: self)
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabels()
        
    }
    
    @IBAction func changeInvetoryButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToQuantityUpdate", sender: sender)
    }
    
    
    func updateFruitLabels() {
        if let strawberryQuantity = fruitStore.fruitInventory["딸기"] {
            strawberry.text = String(strawberryQuantity)
        }
        if let bananaQuantity = fruitStore.fruitInventory["바나나"] {
            banana.text = String(bananaQuantity)
        }
        if let pineAppleQuantity = fruitStore.fruitInventory["파인애플"] {
            pineApple.text = String(pineAppleQuantity)
        }
        if let kiwiQuantity = fruitStore.fruitInventory["키위"] {
            kiwi.text = String(kiwiQuantity)
        }
        if let mangoQuantity = fruitStore.fruitInventory["망고"] {
            mango.text = String(mangoQuantity)
        }
    }
    
    @IBAction func strawBananaJuice(_ sender: UIButton) {
        
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .strawberryBanana)
            displaySuccessAlert(message: "\(JuiceRecipe.strawberryBanana.name)쥬스 나왔습니다.")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .mangoKiwi)
            displaySuccessAlert(message: "\(JuiceRecipe.mangoKiwi.name)쥬스 나왔습니다")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
    
    @IBAction func strawberryButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .strawberry)
            displaySuccessAlert(message: "\(JuiceRecipe.strawberry.name)쥬스 나왔습니다")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
    
    @IBAction func bananaJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .banana)
            displaySuccessAlert(message: "\(JuiceRecipe.banana.name)쥬스 나왔습니다")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
    
    @IBAction func pinAppleJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .pineapple)
            displaySuccessAlert(message: "\(JuiceRecipe.pineapple.name)쥬스 나왔습니다")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
    
    @IBAction func kiwiButton(_ sender: UIButton) {
        
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .kiwi)
            displaySuccessAlert(message: "\(JuiceRecipe.kiwi.name)쥬스 나왔습니다")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
    
    @IBAction func mangoJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .mango)
            displaySuccessAlert(message: "\(JuiceRecipe.mango.name)쥬스 나왔습니다")
            updateFruitLabels()
        } catch {
            displayFailAlert()
        }
    }
}
