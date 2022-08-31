//
//  MakeJuiceController.swift
//  JuiceMaker
//
//  Created by 정연호 on 2022/08/31.
//

import UIKit

class MakeJuiceController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    var fruitsObserve: () -> Void = {   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateFluitLabel()
        fruitsObserve = juiceMaker.fruitsObserve(at: fruitsObserve)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fruitsObserve()
    }
    
    @IBAction func hitStrawberryJuiceButton(_ sender: Any) {
        juiceMaker.makeJuice(of: .strawberryBanana)
    }
    
    func fruitsObserve(_ fruits: [Fruit: Int]) {
        updateFluitLabel()
    }

    func updateFluitLabel() {
        strawberryLabel.text = String((try? juiceMaker.getQuantity(of: .strawberry)) ?? 0)
        bananaLabel.text = String((try? juiceMaker.getQuantity(of: .banana)) ?? 0)
        pineappleLabel.text = String((try? juiceMaker.getQuantity(of: .pineapple)) ?? 0)
        kiwiLabel.text = String((try? juiceMaker.getQuantity(of: .kiwi)) ?? 0)
        mangoLabel.text = String((try? juiceMaker.getQuantity(of: .mango)) ?? 0)
    }
}
