//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit



class ViewController: UIViewController, AlertPresentable {
    
    let fruitStore = FruitStore()
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitStore.delegate = self
        updateFruitLabels()
    }

    @IBAction func changeInvetoryButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToQuantityUpdate", sender: sender)
    }
    
    func updateFruitLabels() {
        strawberry.text = "\(fruitStore.fruitInventory["딸기"] ?? 0)"
        banana.text = "\(fruitStore.fruitInventory["바나나"] ?? 0)"
        pineapple.text = "\(fruitStore.fruitInventory["파인애플"] ?? 0)"
        kiwi.text = "\(fruitStore.fruitInventory["키위"] ?? 0)"
        mango.text = "\(fruitStore.fruitInventory["망고"] ?? 0)"
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

extension ViewController: QuantityVCDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuantityUpdate",
           let quantityVC = segue.destination as? QuantityVC {
            quantityVC.fruitStore = self.fruitStore
            quantityVC.delegate = self
        }
    }
}
