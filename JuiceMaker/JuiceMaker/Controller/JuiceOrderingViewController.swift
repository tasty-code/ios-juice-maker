//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderingViewController: UIViewController, FruitStockDelegate {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private var fruitStore: FruitStore
    private var FruitByLabel: Dictionary<UILabel, Fruit>
    private var juiceMaker: JuiceMaker
    private let juiceMenu: [Juice]
    
    required init?(coder aDecoder: NSCoder) {
        self.fruitStore = FruitStore()
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
        self.FruitByLabel = [:]
        self.juiceMenu = Juice.allCases
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelDict()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureFruitStoreUI()
    }

}

extension JuiceOrderingViewController {
    private func setLabelDict() {
        FruitByLabel = [strawberryLabel: .strawberry, bananaLabel: .banana, pineappleLabel: .pineapple, kiwiLabel: .kiwi, mangoLabel: .mango]
    }
    
    private func presentFruitStockViewController() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: FruitStockViewController.className) as? FruitStockViewController else { return }
        
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        
        self.present(vc, animated: false)
    }
    
    @IBAction func stockChangeButtonTapped(_ sender: UIBarButtonItem) {
        presentFruitStockViewController()
    }
    
    @IBAction func juiceButtonTapped(_ sender: UIButton) {
        guard let juice = juiceMaker.makeJuice(juice: juiceMenu[sender.tag]) else {
            makeRequestAlert(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", okAction: { _ in self.presentFruitStockViewController() })
            return
        }
        makeAlert(title: "알림", message: "\(juice.name) 나왔습니다! 맛있게 드세요!")
        configureFruitStoreUI()
    }
    
    private func configureFruitStoreUI() {
        FruitByLabel.forEach { $0.text = fruitCount(fruit: $1).description }
    }
    
    func fruitCount(fruit: Fruit) -> Int {
        return fruitStore.fruitCount(fruit: fruit)
    }
    
    func updateFruitStore(newFruitStore: Dictionary<Fruit, Int>) {
        fruitStore.updateFruitStore(fruitStore: newFruitStore)
    }
}
