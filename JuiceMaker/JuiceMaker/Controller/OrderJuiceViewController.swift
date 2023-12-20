//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © 유니 & 이안. All rights reserved.
//

import UIKit

class OrderJuiceViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet var orderJuiceButton: [UIButton]!
    
    let juiceMaker = JuiceMaker()
    
    override func viewWillAppear(_ animated: Bool) {
        setInitialFruitLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialFruitLabel()
    }

    private func setInitialFruitLabel() {
        strawberryLabel.text = "\(juiceMaker.fruitStore.inventory(fruit: .strawberry))"
        bananaLabel.text =  "\(juiceMaker.fruitStore.inventory(fruit: .banana))"
        pineappleLabel.text = "\(juiceMaker.fruitStore.inventory(fruit: .pineapple))"
        kiwiLabel.text =  "\(juiceMaker.fruitStore.inventory(fruit: .kiwi))"
        mangoLabel.text =  "\(juiceMaker.fruitStore.inventory(fruit: .mango))"
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case TagNameSpace.strawberryBananaJuiceButton:
            order(juice: .strawberryBananaJuice)
        case TagNameSpace.mangoKiwiJuiceButton:
            order(juice: .mangoKiwiJuice)
        case TagNameSpace.strawberryJuiceButton:
            order(juice: .strawberryJuice)
        case TagNameSpace.bananaJuiceButton:
            order(juice: .bananaJuice)
        case TagNameSpace.pineappleJuiceButton:
            order(juice: .pineappleJuice)
        case TagNameSpace.kiwiJuiceButton:
            order(juice: .kiwiJuice)
        case TagNameSpace.mangoJuiceButton:
            order(juice: .mangoJuice)
        default:
            print("메뉴 준비중입니다.")
            showAlert(title: "주문불가", message: "메뉴 준비중입니다.")
        }
    }
    
    private func order(juice: Juice) {
        do {
            try juiceMaker.make(juice: juice)
            print("\(juice.name) 나왔습니다.")
            showAlert(title: "완성", message: "\(juice.name) 나왔습니다! 맛있게 드세요")
            setInitialFruitLabel()
        } catch let error as JuiceMakerError {
            juiceMakeErrorCase(error)
        } catch {
            print("알 수 없는 에러")
            showAlert(title: "에러", message: "예상치 못한 에러가 발생했습니다.")
        }
    }
    private func juiceMakeErrorCase(_ error: JuiceMakerError) {
        switch error {
        case .outOfStock(_):
            print("\(error.message)")
            showAlertWithConfirmation(title: "재고부족", message: "\(error.message)") { _ in
                self.showFruitInventoryView()
            }
        case .negativeAmount(_):
            print("\(error.message)")
            showAlert(title: "에러", message: "\(error.message)")
        }
    }
    private func showFruitInventoryView() {
        guard let showFruitInventory = self.storyboard?.instantiateViewController(identifier: "FruitInventoryViewController", creator: { coder in
            return FruitInventoryViewController(juiceMaker: self.juiceMaker, coder: coder)
        }) else { return }
        showFruitInventory.modalPresentationStyle = .fullScreen
        self.present(showFruitInventory, animated: true, completion: nil)
    }
    @IBAction func modifyInventoryTapped(_ sender: UIBarButtonItem) {
        showFruitInventoryView()
    }
}
