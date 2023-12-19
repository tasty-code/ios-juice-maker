//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {
    
    let fruitStore = FruitStore()
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    func buttontag() {
        starwBananaJuiceButton.tag = FruitTagEnum.strawberryBanana.rawValue
        magoKiwiJuiceButton.tag = FruitTagEnum.mangoKiwi.rawValue
        starwberrtJuiceButton.tag = FruitTagEnum.strawberry.rawValue
        bananaJuiceButton.tag = FruitTagEnum.banana.rawValue
        pinappleJuiuceButton.tag = FruitTagEnum.pineapple.rawValue
        kiwiJuiceButton.tag = FruitTagEnum.kiwi.rawValue
        mangoJuiceButton.tag = FruitTagEnum.mangoKiwi.rawValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttontag()
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
    
    @IBOutlet weak var starwBananaJuiceButton: UIButton!
    @IBOutlet weak var magoKiwiJuiceButton: UIButton!
    @IBOutlet weak var starwberrtJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pinappleJuiuceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
}

// MARK: - QuantityVCDelegate
extension MainViewController: QuantityViewControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuantityUpdate",
           let quantityViewController = segue.destination as? QuantityViewController {
            quantityViewController.fruitStore = self.fruitStore
            quantityViewController.delegate = self
        }
    }
}

// MARK: - AlertPresentable
extension MainViewController: AlertPresentable {
    @IBAction func makeJuiceButtonTapped(_ sender: UIButton) {
        let juiceName : JuiceRecipe
        switch sender.tag {
        case 1:
            juiceName = .strawberryBanana
        case 2:
            juiceName = .mangoKiwi
        case 3:
            juiceName = .strawberry
        case 4:
            juiceName = .banana
        case 5:
            juiceName = .pineapple
        case 6:
            juiceName = .kiwi
        case 7:
            juiceName = .mango
        default:
            return
        }
        do {
            _ = try fruitStore.makeJuice(juiceRecipe: juiceName)
            showSuccessAlert(message: "\(juiceName.name)")
            updateFruitLabels()
        } catch {
            showFailAlert()
        }
    }
}
