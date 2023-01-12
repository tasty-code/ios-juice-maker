//
//  FruitViewController.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/11.
//

import UIKit

class FruitViewController: UIViewController {
    
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBOutlet var fruitEmojiBundle: [UILabel]!
    @IBOutlet var fruitStoreCountBundle: [UILabel]!
    @IBOutlet var stepperBundle: [UIStepper]!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
    }
    
    var receiveCount: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitStoreCountBundle.forEach { label in
            label.text = receiveCount.first
            print(receiveCount)
        }
    }
    
//    func recevieFromJuiceViewController(fruit: [UILabel], text: [String]) {
//        var textTemp = text
//        fruit.forEach { labelElement in
//            labelElement.text = textTemp.first
//        }
//    }
    
    // 초기화면 -> 재고수정 화면으로 넘어갈때도 과일 재고 갯수가 동일하도록 적용
    // juiceStroeCountBundle, fruitStoreCountBundle 2개 필요
    
    // 스탭퍼 사용시 (-, +)
    
    
}
//        countUp(labels: fruitEmojiBundle, labelsTwo: fruitStoreCountBundle)
//        stepper.wraps = true
//        stepper.autorepeat = false
//        label.text = Int(stepper.value).description

//    func countUp(labels: [UILabel], labelsTwo: [UILabel]) -> String {
//        for (label, label2) in zip(labels, labelsTwo) {
//            guard let aaa = label.text else {
//                return ""
//            }
//            switch SingleFruitJuice(rawValue: aaa) {
//            case .strawberry:
//                return label2.text
//            case .banana:
//            case .pineApple:
//            case .kiwi:
//            case .mango:
//            default:
//                return
//            }
//        }
//    }
