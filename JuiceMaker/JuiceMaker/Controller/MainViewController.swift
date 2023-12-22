//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, QuantityViewControllerDelegate {
    
    var fruitStore = FruitStore()
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    func buttontag() {
        starwBananaJuiceButton.tag = FruitTag.strawberryBanana.rawValueIsInt
        magoKiwiJuiceButton.tag = FruitTag.mangoKiwi.rawValueIsInt
        starwberrtJuiceButton.tag = FruitTag.strawberry.rawValueIsInt
        bananaJuiceButton.tag = FruitTag.banana.rawValueIsInt
        pinappleJuiuceButton.tag = FruitTag.pineapple.rawValueIsInt
        kiwiJuiceButton.tag = FruitTag.kiwi.rawValueIsInt
        mangoJuiceButton.tag = FruitTag.mangoKiwi.rawValueIsInt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttontag()
        fruitStore.delegate = self
        updateFruitLabels()
    }
    
    @IBAction func changeInvetoryButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let quantityVC = storyboard.instantiateViewController(withIdentifier: "quantityVC") as? QuantityViewController {
            quantityVC.fruitStore = self.fruitStore
            quantityVC.delegate = self
            let navigationController = UINavigationController(rootViewController: quantityVC)
            navigationController.modalPresentationStyle = .popover
            self.present(navigationController, animated: true)
        }
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
// MARK: - AlertPresentable
extension MainViewController: AlertPresentable {
    var alertFruitStore: FruitStore? {
        return self.fruitStore
    }
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
