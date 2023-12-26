//
//  QuantityViewController.swift
//  JuiceMaker
//
//  Created by 권태호 on 12/12/2023.
//

// ViewController에서 데이터를 넘겨준다 -> 재고 수정화면에서 데이터를 수정한다 -> 재고 수정화면을 나갈때 수정된 데이터를 ViewController에 넘겨준다 -> 전달 받은 데이터로 업데이트 한다 의 느낌으로 생각해보시면 좋을 것 같아요!

import UIKit

class QuantityViewController: UIViewController {
    var fruitStore: FruitStore?
    weak var delegate: MainViewControllerDelegate?
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mago: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStepperLabel()
        initStepperValue()
        delegate?.updateFruitLabels()
        navigationItem.title = "재고현황"
        let closeButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(dismissModal))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    func updateStepperLabel() {
        delegate?.updateFruitLabels()
    }
    
    func initStepperValue() {
        let strawberryConunt = fruitStore?.fruitInventory["딸기"] ?? 0
        strawberryStepper.value = Double(strawberryConunt)
        strawberry.text = "\(strawberryConunt)"

        let bananaCount = fruitStore?.fruitInventory["바나나"] ?? 0
        bananaStepper.value = Double(bananaCount)
        banana.text = "\(bananaCount)"
        
        let pineappleCount = fruitStore?.fruitInventory["파인애플"] ?? 0
        pineappleStepper.value = Double(pineappleCount)
        pineapple.text = "\(pineappleCount)"
        
        let kiwiCount = fruitStore?.fruitInventory["키위"] ?? 0
        kiwiStepper.value = Double(kiwiCount)
        kiwi.text = "\(kiwiCount)"
        
        let mangoCount = fruitStore?.fruitInventory["망고"] ?? 0
        mangoStepper.value = Double(mangoCount)
        mago.text = "\(mangoCount)"
    }
    
    @objc func dismissModal() {
        self.dismiss(animated: true)
    }
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        if let fruitStore = fruitStore {
            fruitStore.fruitInventory["딸기"] = Int(sender.value)
            updateStepperLabel()
            initStepperValue()
        }
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["바나나"] = Int(sender.value)
        updateStepperLabel()
        initStepperValue()
        
    }
    @IBAction func pinappleStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["파인애플"] = Int(sender.value)
        updateStepperLabel()
        initStepperValue()
    }
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["키위"] = Int(sender.value)
        updateStepperLabel()
        initStepperValue()
    }
    @IBAction func mangoStepper(_ sender: UIStepper) {
        fruitStore?.fruitInventory["망고"] = Int(sender.value)
        updateStepperLabel()
        initStepperValue()
    }
}
