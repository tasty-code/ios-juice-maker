//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    let juiceMaker: JuiceMaker = JuiceMaker(fruitStore: FruitStore(fruitList:[
        FruitStore.Fruit(name: "딸기"),
        FruitStore.Fruit(name: "바나나"),
        FruitStore.Fruit(name: "파인애플"),
        FruitStore.Fruit(name: "키위"),
        FruitStore.Fruit(name: "망고")]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard let navigationViewController = segue.destination as? UINavigationController else {
            print("\(segue.destination)")
            return}
        
//        let 새로운네비게이서ㅕㄴUINavigationController(rootViewController: <#T##UIViewController#>) 이거는 따로 뷰로 연결 안해줘도 됨
//        guard let fruitStoreViewController = navigationViewController.topViewController
    }
    
    @IBOutlet weak var strawberryQantityLabel: UILabel!
    
    @IBOutlet weak var bananaQantityLabel: UILabel!
    
    @IBOutlet weak var pineappleQantityLabel: UILabel!
    
    @IBOutlet weak var kiwiQantityLabel: UILabel!
    
    @IBOutlet weak var mangoQuatityLabel: UILabel!
    
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juiceName = sender.restorationIdentifier else { return }
        juiceMaker.startOrder(juiceName: juiceName)
        updateUI()
    }
    
    
    private func updateUI() {
        strawberryQantityLabel.text = String(juiceMaker.fruitStore.fruitList[0].stock)
        bananaQantityLabel.text = String(juiceMaker.fruitStore.fruitList[1].stock)
        pineappleQantityLabel.text = String(juiceMaker.fruitStore.fruitList[2].stock)
        kiwiQantityLabel.text = String(juiceMaker.fruitStore.fruitList[3].stock)
        mangoQuatityLabel.text = String(juiceMaker.fruitStore.fruitList[4].stock)
    }
}

