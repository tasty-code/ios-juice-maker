//
//  JuiceMaker - OrderViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    
    private let fruitStore = FruitStore.shared
    private let juiceMaker = JuiceMaker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: InventoryViewController.className)
                as? UIViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
            return
        }
        
        do {
            try juiceMaker.makeJuice(juiceType: juice)
        } catch {
            presentAlert(title: "재고가 부족합니다.", message: "다른 쥬스를 선택해주세요.", confirmTitle: "확인")
        }
    }
    
        strawberryQuantityLabel.text = String(fruitStore.fruitContainer[.strawberry, default: 0])
        bananaQuantityLabel.text = String(fruitStore.fruitContainer[.banana, default: 0])
        pineappleQuantityLabel.text = String(fruitStore.fruitContainer[.pineapple, default: 0])
        kiwiQuantityLabel.text = String(fruitStore.fruitContainer[.kiwi, default: 0])
        mangoQuantityLabel.text = String(fruitStore.fruitContainer[.mango, default: 0])
    }
}

