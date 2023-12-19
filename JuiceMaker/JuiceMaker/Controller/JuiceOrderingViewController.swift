//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderingViewController: FruitStoreViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private var juiceMaker: JuiceMaker
    private let juiceMenu: [Juice] = Juice.allCases
    
    required init?(coder aDecoder: NSCoder) {
        self.juiceMaker = JuiceMaker()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelDict()
        configureFruitStoreUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureFruitStoreUI()
    }

}

extension JuiceOrderingViewController {
    func setLabelDict() {
        labelDict = [strawberryLabel: .strawberry, bananaLabel: .banana, pineappleLabel: .pineapple, kiwiLabel: .kiwi, mangoLabel: .mango]
    }
    
    func presentFruitStockViewController() {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: FruitStockViewController.className) as? FruitStockViewController else { return }
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: false)
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
}
