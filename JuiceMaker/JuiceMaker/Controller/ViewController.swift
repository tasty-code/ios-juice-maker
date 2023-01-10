//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    var fruitLabelFruitMap: [UILabel: Fruit]!
    var fruitStore = FruitStore(defaultStock: 20)
    var juiceMaker: JuiceMaker<FruitStore>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        
        fruitLabelFruitMap = [
            strawberryStock: .strawberry,
            bananaStock: .banana,
            pineappleStock: .pineapple,
            kiwiStock: .kiwi,
            mangoStock: .mango
        ]
        updateStockValue()
    }
    
    @IBAction func ModifyStockButtonTapped(_ sender: UIBarButtonItem) {
        showStoreView()
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        let orderName = sender.currentTitle
        let juiceName = orderName?.replacingOccurrences(of: " 주문", with: "")
        guard let juice = Juice(rawValue: juiceName ?? "") else {
            print("팔 수 없음")
            return
        }
        do {
            _ = try juiceMaker.make(juice: juice)
            showSuccessAlert(juice: juice)
        } catch is JuiceMakerError {
            showFailAlert()
        } catch {
            print(error)
        }
        updateStockValue()
    }
    
    
    func showStoreView() {
        guard let storeNaviVC = storyboard?.instantiateViewController(withIdentifier: "storeNavi") as? UINavigationController else { return }
        
        storeNaviVC.modalPresentationStyle = .fullScreen
        storeNaviVC.modalTransitionStyle = .coverVertical
        
        present(storeNaviVC, animated: true)
    }
    
    
    func test() {
        do {
            let juice = try juiceMaker.make(juice: .strawberryJuice)
            print(juice)
        } catch {
            print(error)
        }
    }
    
    func updateStockValue() {
        for (label, fruit) in fruitLabelFruitMap {
            label.text = String(fruitStore.items[fruit, default: 0])
        }
    }
}

//MARK: - Alert 구현
extension ViewController {
    func showSuccessAlert(juice: Juice) {
        let successAlert = UIAlertController(title: nil,
                                             message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
                                             preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인",
                                          style: .default)
        
        successAlert.addAction(confirmAction)
        present(successAlert, animated: true)
    }
    
    func showFailAlert() {
        let failAlert = UIAlertController(title: nil,
                                          message: "재고가 모자라요. 재고를 수정할까요?",
                                          preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "예",
                                          style: .default,
                                          handler: { _ in self.showStoreView() })
        let cancelAction = UIAlertAction(title: "아니오",
                                         style: .cancel)
        
        failAlert.addAction(confirmAction)
        failAlert.addAction(cancelAction)
        present(failAlert, animated: true)
    }
}
