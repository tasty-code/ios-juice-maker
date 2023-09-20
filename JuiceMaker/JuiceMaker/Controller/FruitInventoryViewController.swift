//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/14.
//

import UIKit

final class FruitInventoryViewController: UIViewController {
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initIdentifier()
        updateFruitLabels()
        initStepperValue()
    }
    
    private func initIdentifier() {
        strawberryLabel.accessibilityIdentifier = "딸기"
        bananaLabel.accessibilityIdentifier = "바나나"
        pineappleLabel.accessibilityIdentifier = "파인애플"
        kiwiLabel.accessibilityIdentifier = "키위"
        mangoLabel.accessibilityIdentifier = "망고"
        strawberryStepper.accessibilityIdentifier = "딸기"
        bananaStepper.accessibilityIdentifier = "바나나"
        pineappleStepper.accessibilityIdentifier = "파인애플"
        kiwiStepper.accessibilityIdentifier = "키위"
        mangoStepper.accessibilityIdentifier = "망고"
    }
    
    private func initStepperValue() {
        let fruitSteppers = [strawberryStepper, bananaStepper, pineappleStepper, kiwiStepper, mangoStepper]
        
        fruitSteppers.forEach { stepper in
            guard let tempStepper = stepper, let id = tempStepper.accessibilityIdentifier else {
                return
            }
            guard let tempJuiceMaker = juiceMaker else {
                return
            }
            do {
                guard let fruit = try Fruit(id) else {
                    return
                }
                let count = try tempJuiceMaker.remainingCount(fruit: fruit)
                tempStepper.value = Double(count)
            } catch {
                defaultAlert(message: InventoryError.invalidError.description)
            }
        }
    }
    
    private func updateFruitLabels() {
        let fruitLabels = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel]
        fruitLabels.forEach { label in
            guard let tempLabel = label, let id = tempLabel.accessibilityIdentifier else {
                return
            }
            do {
                guard let fruit = try Fruit(id), let tempJuiceMaker = juiceMaker else {
                    return
                }
                let count = try tempJuiceMaker.remainingCount(fruit: fruit)
                tempLabel.text = "\(count)"
            } catch {
                defaultAlert(message: InventoryError.invalidError.description)
            }
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let id = sender.accessibilityIdentifier else { return }
        do {
            guard let fruit = try Fruit(id), let tempJuiceMaker = juiceMaker else { return }
            tempJuiceMaker.changeCount(fruit: fruit, newCount: UInt(sender.value))
            updateFruitLabels()
        } catch {
            defaultAlert(message: InventoryError.invalidError.description)
        }
    }
}

extension FruitInventoryViewController {
    private func defaultAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default)
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
}
