//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by Matthew on 12/5/23.
//

import UIKit

class JuiceMakerViewController: UIViewController {
    var juiceMaker = JuiceMaker.shared
    
    @IBOutlet weak var navigationRightButton: UIBarButtonItem!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet weak var orderMangoKiwiButton: UIButton!
    @IBOutlet weak var orderStrawberryJuice: UIButton!
    @IBOutlet weak var orderBananaJuice: UIButton!
    @IBOutlet weak var orderKiwiButton: UIButton!
    @IBOutlet weak var orderMangoButton: UIButton!
    
    @IBOutlet weak var quantityStrawberryJuiceLabel: UILabel!
    @IBOutlet weak var quantityStrawberryBananaJuiceLabel: UILabel!
    @IBOutlet weak var quantityBananaJuiceLabel: UILabel!
    @IBOutlet weak var quantityPineappleJuiceLabel: UILabel!
    @IBOutlet weak var quantityKiwiJuiceLabel: UILabel!
    @IBOutlet weak var quantityMangoKiwiJuiceLabel: UILabel!
    @IBOutlet weak var quantityMangoJuiceLabel: UILabel!
    
    lazy var buttons: [UIButton] = {
        return [
            orderStrawberryBananaJuiceButton,
            orderPineappleJuiceButton,
            orderMangoKiwiButton,
            orderStrawberryJuice,
            orderBananaJuice,
            orderKiwiButton,
            orderMangoButton
        ]
    }()
    
    lazy var labels: [UILabel] = {
       return [
            quantityStrawberryJuiceLabel,
            quantityStrawberryBananaJuiceLabel,
            quantityBananaJuiceLabel,
            quantityPineappleJuiceLabel,
            quantityKiwiJuiceLabel,
            quantityMangoKiwiJuiceLabel,
            quantityMangoJuiceLabel
       ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let font = UIFont(name: "DungGeunMo", size: 20) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
        }
        setNavigationButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        labels.forEach { label in
            label.clipsToBounds = true
            label.layer.cornerRadius = label.bounds.height / 2
        }
        
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
        updateQuantityLabel()
    }
    
    func setNavigationButton() {
        let font = UIFont(name: "DungGeunMo", size: 20)!
        let customButton = UIButton()
        customButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        customButton.setTitle("재고수정", for: .normal)
        customButton.setTitleColor(.blue, for: .normal)
        customButton.setTitleFont(font: font)
        customButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationRightButton.customView = customButton
        customButton.addTarget(self, action: #selector(conectDetailViewController), for: .touchUpInside)
    }
    
    @objc func conectDetailViewController() {
        performSegue(withIdentifier: "DetailView", sender: nil)
    }
    
    private func updateQuantityLabel() {
        for (index, juiceType) in JuiceType.allCases.enumerated() {
            let quantity = juiceMaker.showJuiceQuantity(juice: juiceType)
            labels[index].text = "\(quantity)"
        }
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func strawberryBananajuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .strawberryBananaJuice) {
            self.showAlert(message: "딸바 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func pineapplejuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .pineappleJuice) {
            self.showAlert(message: "파인애플 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    @IBAction func mangoKiwijuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .mangoKiwiJuice) {
            self.showAlert(message: "망키 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    @IBAction func strawberryjuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .strawberryJuice) {
            self.showAlert(message: "딸기 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    @IBAction func bananajuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .bananaJuice) {
            self.showAlert(message: "바나나 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    @IBAction func kiwijuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .kiwiJuice) {
            self.showAlert(message: "키위 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    @IBAction func mangojuiceButtonTapped(_ sender: UIButton) {
        if juiceMaker.makeJuice(juice: .mangoJuice) {
            self.showAlert(message: "망고 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            self.showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        }
    }
    
}

extension UIButton {
    func setTitleFont(font: UIFont) {
        self.titleLabel?.font = font
    }
}
