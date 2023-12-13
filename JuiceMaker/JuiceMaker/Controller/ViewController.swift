//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FruitStoreDelegate, AlertPresentable {
    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineApple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    func didUpdateFruitInventory() {
        updateFruitLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fruitStore.delegate = self
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
            showSuccessAlert(message: "\(JuiceRecipe.strawberryBanana.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .mangoKiwi)
            showSuccessAlert(message: "\(JuiceRecipe.mangoKiwi.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
    
    @IBAction func strawberryButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .strawberry)
            showSuccessAlert(message: "\(JuiceRecipe.strawberry.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
    
    @IBAction func bananaJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .banana)
            showSuccessAlert(message: "\(JuiceRecipe.banana.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
    
    @IBAction func pinAppleJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .pineapple)
            showSuccessAlert(message: "\(JuiceRecipe.pineapple.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
    
    @IBAction func kiwiButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .kiwi)
            showSuccessAlert(message: "\(JuiceRecipe.kiwi.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
        
    }
    
    @IBAction func mangoJuiceButton(_ sender: UIButton) {
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: .mango)
            showSuccessAlert(message: "\(JuiceRecipe.mango.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
}
