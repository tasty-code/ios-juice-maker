
import UIKit

// MARK: - StockManageViewController init & deinit
class StockManageViewController: UIViewController {
    
    let reception: Reception
    
    init?(coder: NSCoder, reception: Reception) {
        self.reception = reception
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - StockManageViewController LifeCycle
extension StockManageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}




