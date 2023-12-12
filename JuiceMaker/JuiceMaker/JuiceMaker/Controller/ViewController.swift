//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryImageView: UIImageView!
    @IBOutlet var FruitLabel: [UILabel]!
    
    var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiUpdate()
    }
    
    
    @IBAction func strawberryJuice(_ sender: UIButton) {
        var juice: Juice
        switch sender.tag {
        case 0:
            juice = .strawberryBananaJuice
        case 1:
            juice = .mangoKiwiJuice
        case 2:
            juice = .strawberryJuice
        case 3:
            juice = .bananaJuice
        case 4:
            juice = .pineappleJuice
        case 5:
            juice = .kiwiJuice
        case 6:
            juice = .mangoJuice
        default:
            return
        }
        
        do {
            try juiceMaker.makeJuice(juice)
            uiUpdate()
            let successAlert = UIAlertController(title: "주문 완료", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            successAlert.addAction(UIAlertAction(title: "확인", style: .default))
            present(successAlert, animated: true)
        } catch ErrorType.insufficientFruits {
            let stockAlert = UIAlertController(title: "재고 부족", message: "\(juice.name) 재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let actionYes = UIAlertAction(title: "예", style: .default, handler: {
                _ in self.performSegue(withIdentifier: "secondVC", sender: self)
            })
            let actionNo = UIAlertAction(title: "아니요", style: .cancel)
            
            actionYes.setValue(UIColor.red, forKey: "titleTextColor")
            
            stockAlert.addAction(actionYes)
            stockAlert.addAction(actionNo)
            
            present(stockAlert, animated: true)
        } catch {
            print("Unknown error")
        }
    }
    @IBAction func stockUpdateAction(_ sender: UIBarButtonItem) {
        guard let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        self.navigationController?.pushViewController(vc2, animated: false)
    }
    
    func uiUpdate() {
        for label in FruitLabel {
            let fruit: Fruit
            switch label.tag {
            case 0:
                fruit = .strawberry
            case 1:
                fruit = .banana
            case 2:
                fruit = .kiwi
            case 3:
                fruit = .mango
            case 4:
                fruit = .pineapple
            default:
                continue
            }
            label.text = "\(juiceMaker.fruitStore.getQuantity(of: fruit))"
        }
    }
}


enum StoryType {
    static let first = UIStoryboard(name: "Main", bundle: .main)
}

