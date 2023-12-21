//
//  MainViewController.swift
//  JuiceMaker
//
//  Created by Taewan Kim on 12/8/23.
//

import UIKit

protocol SendFruitQuantityDelegate: AnyObject {
    func sendFruitQuantityData(fruitQuantity: [FruitName: Int])
}

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    weak var sendFruitQuantityDelegate: SendFruitQuantityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitQuantityLabels()
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
            strawberryQuantityLabel.text = String(fruitQuantity)
        case .banana:
            bananaQuantityLabel.text = String(fruitQuantity)
        case .pineapple:
            pineappleQuantityLabel.text = String(fruitQuantity)
        case .kiwi:
            kiwiQuantityLabel.text = String(fruitQuantity)
        case .mango:
            mangoQuantityLabel.text = String(fruitQuantity)
        }
    }
    
    private func moveModifyInventoryView() {
        guard let modifyInventoryVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyInventoryViewController") as? ModifyInventoryViewController else { return }
        
        modifyInventoryVC.sendFruitQuantityDelegate = self
        self.sendFruitQuantityDelegate = modifyInventoryVC
        
        self.sendFruitQuantityDelegate?.sendFruitQuantityData(fruitQuantity: juiceMaker.fruitStore.currentQuantityOfAllFruits())
        
        self.navigationController?.pushViewController(modifyInventoryVC, animated: true)
    }
    
    private func showResultAlert(_ result: Result<Void, JuiceError>) {
        switch result {
        case .success:            
            updateFruitQuantityLabels()
            
            AlertBuilder(viewController: self)
                .addAction("확인", style: .default)
                .addMessage(
                    title:"주문 완료",
                    message: "쥬스가 나왔습니다! 맛있게 드세요!",
                    style: .alert
                )
            
        case .failure(let error):
            switch error {
            case JuiceError.outOfStock:
                AlertBuilder(viewController: self)
                    .addAction("예", style: .default) {
                    [weak self] in
                    guard let self = self else { return }
                    moveModifyInventoryView()
                }
                    .addAction("아니오", style: .cancel)
                    .addMessage(title:"재료 부족", message: "재료가 모자라요. 재고를 수정할까요?", style: .alert)
                
            case JuiceError.unknown:
                AlertBuilder(viewController: self)
                    .addAction("확인", style: .default)
                    .addMessage(title:"알 수 없는 에러", message: "에러가 발생하였습니다.", style: .alert)
                
            case JuiceError.quantityOfAllFruitsAccessFailed:
                AlertBuilder(viewController: self)
                    .addAction("확인", style: .default)
                    .addMessage(title:"유효하지 않은 레시피", message: "주문할 수 없는 쥬스입니다.", style: .alert)
            }
        }
    }
    
    @IBAction func fruitJuiceOrderButtonTapped(_ sender: UIButton) {
        
        switch sender {
        case strawberryJuiceOrderButton:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .strawberry))
        case bananaQuantityLabel:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .banana))
        case pineappleJuiceOrderButton:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .pineapple))
        case kiwiJuiceOrderButton:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .kiwi))
        case mangoJuiceOrderButton:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .mango))
        case strawberryBananaJuiceOrderButton:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .straberryBanana))
        case mangoKiwiJuiceOrderButton:
            showResultAlert(juiceMaker.makeJuice(juiceMenu: .mangoKiwi))
        default:
            showResultAlert(.failure(JuiceError.unknown))
        }
    }
    @IBAction func modifyInventoryButton(_ sender: UIBarButtonItem) {
        moveModifyInventoryView()
    }
}

extension MainViewController: SendFruitQuantityDelegate {
    func sendFruitQuantityData(fruitQuantity: [FruitName : Int]) {
        self.juiceMaker.fruitStore.setAllFruitStockQuantity(allFruitQuantityDictionary: fruitQuantity)
        updateFruitQuantityLabels()
        
    }
}
