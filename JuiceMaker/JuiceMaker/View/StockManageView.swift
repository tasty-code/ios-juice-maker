
import UIKit

final class StockManageView : UIView {
    
    // MARK: - 수량 라벨
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    // MARK: - 버튼
    
    @IBOutlet weak var strawberryStockButton: UIStepper!
    @IBOutlet weak var bananaStockButton: UIStepper!
    @IBOutlet weak var pineappleStockButton: UIStepper!
    @IBOutlet weak var kiwiStockButton: UIStepper!
    @IBOutlet weak var mangoStockButton: UIStepper!
}

