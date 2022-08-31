//
//  FruitManagementController.swift
//  JuiceMaker
//
//  Created by 정연호 on 2022/08/31.
//

import UIKit

class FruitManagementController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateFluitLabel()
        // fruitsObserve = juiceMaker.fruitsObserve(at: fruitsObserve)
    }

    func updateFluitLabel() {
        strawberryLabel.text = String((try? juiceMaker.getQuantity(of: .strawberry)) ?? 0)
        bananaLabel.text = String((try? juiceMaker.getQuantity(of: .banana)) ?? 0)
        pineappleLabel.text = String((try? juiceMaker.getQuantity(of: .pineapple)) ?? 0)
        kiwiLabel.text = String((try? juiceMaker.getQuantity(of: .kiwi)) ?? 0)
        mangoLabel.text = String((try? juiceMaker.getQuantity(of: .mango)) ?? 0)
    }
}
