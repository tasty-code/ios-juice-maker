//
//  MainViewController.swift
//  JuiceMaker
//
//  Created by Taewan Kim on 12/8/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var strawberryQuantity: UILabel!
    @IBOutlet weak var bananaQuantity: UILabel!
    @IBOutlet weak var pineappleQuantity: UILabel!
    @IBOutlet weak var kiwiQuantity: UILabel!
    @IBOutlet weak var mangoQuantity: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitQuantities), name: NSNotification.Name("JuiceMade"), object: nil)
        
        let allFruitQuantity = juiceMaker.fruitStore.currentQuantityOfAllFruits()
        guard let strawberry = allFruitQuantity[.strawberry] else {
            return
        }
        strawberryQuantity.text = String(strawberry)
    }
    
    @objc func updateFruitQuantities() {
        guard let strawberry = juiceMaker.fruitStore.currentFruitStockQuantity(fruitName: .strawberry) else {
            return
        }
        strawberryQuantity.text = String(strawberry)
    }
    
    @IBAction func StrawberryJuiceOrderButton(_ sender: UIButton) {
        let result = juiceMaker.makeJuice(juiceMenu: .strawberry)
        
        switch result {
        case .success:
            let alert = UIAlertController(title: "주문 완료", message: "쥬스가 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        case .failure(let error):
            switch error {
            case JuiceError.outOfStock:
                let alert = UIAlertController(title: "재료 부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
                    self.performSegue(withIdentifier: "modifyInventorySegue", sender: nil)
                }))
                alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
                
            case JuiceError.unknown:
                break
                
            case JuiceError.quantityOfAllFruitsAccessFailed:
                let alert = UIAlertController(title: "유효하지 않은 레시피", message: "주문할 수 없는 쥬스입니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
