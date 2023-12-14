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
        
        observeJuiceMadeNotification()
        updateFruitQuantityLabels()
    }
    
    private func observeJuiceMadeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitQuantities), name: NSNotification.Name("JuiceMade"), object: nil)
    }
    
    private func updateFruitQuantityLabels() {
        let allFruitQuantity = juiceMaker.fruitStore.currentQuantityOfAllFruits()
        
        updateFruitLabel(fruitName: .strawberry, quantity: allFruitQuantity[.strawberry])
        updateFruitLabel(fruitName: .banana, quantity: allFruitQuantity[.banana])
        updateFruitLabel(fruitName: .pineapple, quantity: allFruitQuantity[.pineapple])
        updateFruitLabel(fruitName: .kiwi, quantity: allFruitQuantity[.kiwi])
        updateFruitLabel(fruitName: .mango, quantity: allFruitQuantity[.mango])
    }
    
    private func updateFruitLabel(fruitName: FruitName, quantity: Int?) {
        guard let fruitQuantity = quantity else {
            showResultAlert(.failure(JuiceError.unknown))
            return
        }
        
        switch fruitName {
        case .strawberry:
            strawberryQuantity.text = String(fruitQuantity)
        case .banana:
            bananaQuantity.text = String(fruitQuantity)
        case .pineapple:
            pineappleQuantity.text = String(fruitQuantity)
        case .kiwi:
            kiwiQuantity.text = String(fruitQuantity)
        case .mango:
            mangoQuantity.text = String(fruitQuantity)
        }
    }
    
    @objc func updateFruitQuantities() {
        updateFruitQuantityLabels()
    }
    
    private func showResultAlert(_ result: Result<Void, JuiceError>) {
        switch result {
        case .success:
            NotificationCenter.default.post(name: NSNotification.Name("JuiceMade"), object: nil)
            AlertBuilder(vc: self).addAction("확인", style: .default).addMessage(title:"주문 완료", message: "쥬스가 나왔습니다! 맛있게 드세요!", style: .alert)
            
        case .failure(let error):
            
            switch error {
            case JuiceError.outOfStock:
                AlertBuilder(vc: self).addAction("예", style: .default) {
                    [weak self] in
                        guard let self = self else { return }
                    self.performSegue(withIdentifier: "modifyInventorySegue", sender: nil)
                }
                        .addAction("아니오", style: .cancel).addMessage(title:"재료 부족", message: "재료가 모자라요. 재고를 수정할까요?", style: .alert)
                
            case JuiceError.unknown:
                AlertBuilder(vc: self).addAction("확인", style: .default).addMessage(title:"알 수 없는 에러", message: "에러가 발생하였습니다.", style: .alert)
                
            case JuiceError.quantityOfAllFruitsAccessFailed:
                AlertBuilder(vc: self).addAction("확인", style: .default).addMessage(title:"유효하지 않은 레시피", message: "주문할 수 없는 쥬스입니다.", style: .alert)
            }
        }
    }
    
    @IBAction func fruitJuiceOrderButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else {
             return
         }
        
        switch title {
        case "딸기쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .strawberry))
        case "바나나쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .banana))
        case "파인애플쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .pineapple))
        case "키위쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .kiwi))
        case "망고쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .mango))
        case "딸바쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .straberryBanana))
        case "망키쥬스 주문":
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .mangoKiwi))
        default:
            showResultAlert(.failure(JuiceError.unknown))
        }
    }
}
