//
//  StockManagementViewController.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/19.
//

import UIKit

final class StockManagerViewController: UIViewController {
    
    // MARK: - Properties
    
    var fruitStore: FruitStore!
    
    @IBOutlet private var strawberryQuantityLabel: StrawberryQuantityLabel!
    @IBOutlet private var bananaQuantityLabel: BananaQuantityLabel!
    @IBOutlet private var pineappleQuantityLabel: PineappleQuantityLabel!
    @IBOutlet private var kiwiQuantityLabel: KiwiQuantityLabel!
    @IBOutlet private var mangoQuantityLabel: MangoQuantityLabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuantityLabel()
    }
    
    // MARK: - Methods
    
    @IBAction private func pressCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

    private func displayQuantityLabel() {
        let fruitQuantityLabels: [FruitQuantityLabel] = [strawberryQuantityLabel,
                                                         bananaQuantityLabel,
                                                         pineappleQuantityLabel,
                                                         kiwiQuantityLabel,
                                                         mangoQuantityLabel]
        
        for label in fruitQuantityLabels {
            guard let furit = label.fruit() else { continue }
            let fruitQuantity = fruitStore.quantity(of: furit)
            label.text = String(fruitQuantity)
        }
    }
}
