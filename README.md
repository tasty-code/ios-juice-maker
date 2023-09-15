# 쥬스 자판기 [STEP 2] Mango, SwainYun

리뷰어: @zdodev
참가자: 망고, 스웨인

안녕하세요, 소대!
쥬스 자판기 [STEP 2] PR 올립니다.

------------------------------------

## 프로젝트 구성

### JuiceMaker, FruitStore

* **쥬스와 과일의 종류를 나타내는 열거형**
```swift
private enum JuiceType: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBananaMixJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiMixJuice = "망키쥬스"
    
    var recipe: [Fruit] {
        switch self {
        case .strawberryJuice: return [Fruit(.strawberry, 16)]
        case .bananaJuice: return [Fruit(.banana, 2)]
        case .kiwiJuice: return [Fruit(.kiwi, 3)]
        case .pineappleJuice: return [Fruit(.pineapple, 2)]
        case .strawberryBananaMixJuice: return [Fruit(.strawberry, 10), Fruit(.banana, 1)]
        case .mangoJuice: return [Fruit(.mango, 3)]
        case .mangoKiwiMixJuice: return [Fruit(.mango, 2), Fruit(.kiwi, 1)]
        }
    }
}

private enum FruitType: String, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case mango = "망고"
}
```

    * JuiceType, FruitType
    1. FruitStore 클래스 내에서만 사용할 것이라고 판단, FruitStore Nested Type으로 변경
    2. Storyboard의 각 버튼과 재고 현황을 표시하기 위해 Accessability ID와 매칭할 수 있도록 각 case별 RawValue 설정
> 각 버튼과 재고 라벨을 매칭할 수단으로, Restoration ID는 UI 복구 시 사용되는 것이라고 해서 사용하지 않는 것으로 의견 나눴고 버튼의 타이틀텍스트를 이용하는 것은 코드가 지저분해 보였습니다.
> 다른 방법도 많이 있겠지만 Accessability ID를 사용하기로 결정했습니다.

* **Fruit 모델**
```swift
private struct Fruit {
    let fruitType: FruitType
    let quantity: Int

    init(_ fruitType: FruitType, _ quantity: Int) {
        self.fruitType = fruitType
        self.quantity = quantity
    }
}
```
    * 주스 만드는 데 필요한 과일 종류와 수량을 가져오기 위한 구조체
    1. 마찬가지로 FruitStore 클래스 내에 위치하는 것으로 변경
    2. 개수과 종류 정보를 가지고 비교할 수 있도록 함

* **FruitStore 클래스**
```swift
final class FruitStore {
    private var inventory: [FruitType: Int]
    
    init() {
        let initialQuantity: Int = 10
        
        var inventory: [FruitType: Int] = [:]
        
        for fruitType in FruitType.allCases {
            inventory[fruitType] = initialQuantity
        }
        
        self.inventory = inventory
    }
}
```

    * FruitStore class
    1. 과일 종류별 재고를 쉽게 다루기 위해 Dictionary가 적절한 것 같아 Dictionary로 변경
    2. 초기값 설정 시 반복되는 숫자 '10'을 다루기 위해 init 작업에 추가
    
* **receiveOrder() 메서드**
```swift
func receiveOrder(juiceName: String) throws {
    guard let juice = JuiceType(rawValue: juiceName) 
    else { throw JuiceMakerError.invalidSelection }
    let recipe = juice.recipe
    
    for ingredient in recipe {
        try validateStock(with: ingredient)
    }
    
    for ingredient in recipe {
        try updateInventoryStock(with: ingredient)
    }
}
```

    * receiveOrder()
    1. 버튼 입력으로 받아온 juiceName(Accessability ID로 등록되어있던)으로 JuiceType이 있는지 확인, 
    2. 있다면 그 쥬스의 레시피를 확인, 
    3. 레시피에서 요구한 과일 및 수량과 현재 재고를 확인, 제조 가능하다면 사용한만큼 재고 조정
> 변경 전 메서드에서, 재고 조정 시마다 관련 함수를 호출해야할 때 반복되는 코드를 여러번 작성하는 것이 마음에 들지 않았는데 반복문 사용으로 이를 해결했습니다.

* **유효성 검사, 재고 변경**
```swift
private func validateStock(with fruit: Fruit) throws {
    guard let stock = self.inventory[fruit.fruitType], stock - fruit.quantity >= 0 else { throw JuiceMakerError.outOfStock }
}

private func updateInventoryStock(with fruit: Fruit) throws {
    guard let stock = self.inventory[fruit.fruitType] else { throw JuiceMakerError.invalidSelection }
    let remainStock = stock - fruit.quantity
    self.inventory[fruit.fruitType] = remainStock
}
```

    * 유효성 검사, 재고 변경
    1. validateStock(): 현재 재고 확인, 요구 수량을 빼고도 재고가 0 이상이면 통과, 아니면 outOfStock 에러 전파
    2. updateInventoryStock(): 요구 수량만큼 빼고 변경된 값으로 재고 갱신
> 재고 부분을 Dictionary로 변경하면서 관련 메서드들도 조금씩 바꾸어 주었습니다.

---------------------------------------

### JuiceMakerViewController

* **makeJuice() 메서드**
```swift
@IBAction func makeJuice(_ sender: UIButton) {
    guard let buttonId = sender.accessibilityIdentifier 
    else { return }
    do {
        try juiceMaker.makeJuice(juiceName: buttonId)
        manageFruitStock()
        showAlertCompletionJuiceMaking(buttonId)
    } catch let error {
        showAlertOutOfStock(error)
    }
}
```

    * makeJuice()
    1. Accessability ID를 통해 어떤 버튼이 입력되었는지 식별
    2. 모델 쪽 메서드와 연결, 재고 확인 및 수정 작업 등이 이루어짐
    3. 성공 여부에 따라 적절한 얼럿 표시
> VC의 makeJuice 메서드와 Model의 makeJuice 메서드 이름이 겹치는데, 이럴 경우 어떤 문제가 발생할 수 있을까요?

* **manageFruitStock() 메서드**
```swift
private func manageFruitStock() {
    let inventory = juiceMaker.checkFruitStoreInventory()

    strawberryStockLabel.text = String(inventory["딸기"] ?? 0)
    bananaStockLabel.text = String(inventory["바나나"] ?? 0)
    kiwiStockLabel.text = String(inventory["키위"] ?? 0)
    pineappleStockLabel.text = String(inventory["파인애플"] ?? 0)
    mangoStockLabel.text = String(inventory["망고"] ?? 0)
}
```

    * manageFruitStock()
    1. 과일명과 재고 정보를 읽어옴
    2. 재고 수량을 표시하는 라벨에 현재 재고 표시
> 쥬스 주문 후 변경된 재고로 새로고쳐주기 위해 makeJuice 메서드 내에서 다시 호출합니다.
> 또 최초 뷰 렌더링 시 표시될 수 있도록 viewDidLoad() 내에서 호출합니다.


* **showAlertCompletionJuiceMaking() 메서드**
```swift
private func showAlertCompletionJuiceMaking(_ juiceName: String) {
    let alert = UIAlertController(title: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
    let yes = UIAlertAction(title: "감사합니다!", style: .default)
    alert.addAction(yes)
    present(alert, animated: true, completion: nil)
}
```

    * showAlertCompletionJuiceMaking()
    1. 쥬스 만들기에 성공할 경우 얼럿 표시
    2. 얼럿을 닫을 수 있는 버튼 추가
> 주스 재고가 있을 경우나 실행되는 메서드 입니다. 주문한 주스 이름이 alert해주고 창을 닫을 수 있도록 "yes" UIAlertAction을 추가해 주었습니다.

* **showAlertOutOfStock() 메서드**
```swift
private func showAlertOutOfStock(_ error: Error) {
    let alert = UIAlertController(title: "\(error)", message: nil, preferredStyle: .alert)
    let yes = UIAlertAction(title: "예", style: .default) { _ in
        self.moveAdjustStorageView()
    }
    let no = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
    alert.addAction(yes)
    alert.addAction(no)
    present(alert, animated: true, completion: nil)
}
```

    * showAlertOutOfStock()
    1. 재고 부족으로 전파된 JuiceMakerError.outOfStock 상황에 대한 처리
    2. 재고 설정 뷰로 이동하거나 얼럿을 닫을 수 있는 버튼 두개 추가
>음료를 제조하기에 재고가 부족한 경우 실행되는 메서드이며 
> * yes경우: moveAdjustStorageView를 실행합니다.
> * no경우: alert을 닫습니다.
