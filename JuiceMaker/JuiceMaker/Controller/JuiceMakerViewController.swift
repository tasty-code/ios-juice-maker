//
//  JuiceMaker - ViewController.swift
//  Created by Kyle& L
//

import UIKit

final class JuiceMakerViewController: UIViewController, JuiceMakerAlert {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var fruitStore: FruitStore = FruitStore(strawberryStock: 10,
                                            bananaStock: 10,
                                            pineappleStock: 10,
                                            kiwiStock: 10,
                                            mangoStock: 10)
    lazy var juiceMaker: JuiceMaker = JuiceMaker(fruitStore: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        guard
            let strawberryStock = fruitStore.fruitStocks[.strawberry],
            let bananaStock = fruitStore.fruitStocks[.banana],
            let pineappleStock = fruitStore.fruitStocks[.pineapple],
            let kiwiStock = fruitStore.fruitStocks[.kiwi],
            let mangoStock = fruitStore.fruitStocks[.mango]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "재고수정",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(showFruitStoreViewController))
    }
    
    private func startJuiceMakerProcess(juice: Juice) throws {
        try juiceMaker.checkUnderstockedFruits(juice: juice)
        juiceMaker.makeJuice(juice: juice)
        showJuiceMakerAlert(isCompletedMakeJuice: true,
                            message: "\(juice.name) 나왔습니다! 맛있게 드세요!",
                            completion: nil)
    }
    /*
     instantiateViewController(identifier:creator:): 스토리보드에서 지정된 뷰 컨트롤러를 생성하고 사용자 지정 초기화 코드를 사용하여 초기화합니다.

     instantiateViewController(withIdentifier:): 지정된 식별자를 가진 뷰 컨트롤러를 생성하고 스토리보드의 데이터로 초기화합니다.

     */
    @objc
    func showFruitStoreViewController() {
        guard let a = storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") else {
            return
        } // 지정된 식별자를 가진 뷰 컨트롤러를 생성하고 스토리보드의 데이터로 초기화합니다.
        guard
            let fruitStoreViewController = storyboard?.instantiateViewController(identifier: "FruitStoreViewController", creator: { coder in
                return FruitStoreViewController(fruitStore: self.fruitStore, coder: coder)
            }) //  스토리보드에서 지정된 뷰 컨트롤러를 생성하고 사용자 지정 초기화 코드를 사용하여 초기화합니다.
        else {
            fatalError("init(coder:) has not been implemented")
        }
        self.navigationController?.pushViewController(fruitStoreViewController, animated: true)
    }
    
    private func proceedMakingJuice(juice: Juice, labels: [UILabel]) {
        do {
            try startJuiceMakerProcess(juice: juice)
            let sortedJuiceRecipe = juice.recipe.sorted(by: { $0.value > $1.value })
            for (index, ingredient) in sortedJuiceRecipe.enumerated() {
                guard
                    let remainStock = fruitStore.fruitStocks[ingredient.key]
                else {
                    return
                }
                guard index < labels.count else { return }
                labels[index].text = String(remainStock)
            }
        } catch {
            showJuiceMakerAlert(isCompletedMakeJuice: false,
                                message: error.localizedDescription,
                                completion: {
                self.showFruitStoreViewController()
            })
        }
    }
    
    @IBAction private func tappedStrawberryBananaJuiceButton(_ sender: UIButton) {
        proceedMakingJuice(juice: .strawberryBananaJuice, labels: [strawberryStockLabel, bananaStockLabel])
    }
    
    @IBAction private func tappedMangoKiwiJuiceButton(_ sender: UIButton) {
        proceedMakingJuice(juice: .mangoKiwiJuice, labels: [mangoStockLabel, kiwiStockLabel])
    }
    
    @IBAction private func tappedStrawberryJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .strawberryJuice, labels: [strawberryStockLabel])
    }
    
    @IBAction private func tappedBananaJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .bananaJuice, labels: [bananaStockLabel])
    }
    
    @IBAction private func tappedPineappleJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .pineappleJuice, labels: [pineappleStockLabel])
    }
    
    @IBAction private func tappedKiwiJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .kiwiJuice, labels: [kiwiStockLabel])
    }
    
    @IBAction private func tappedMangoJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .mangoJuice, labels: [mangoStockLabel])
    }
}
