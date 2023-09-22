# ios-juice-maker

## 프로젝트 설명
- 과일 저장고의 재고에 따라 주스를 만들어주는 프로그램


<img src="https://hackmd.io/_uploads/HyJ4h551p.png" width = 400>
<img src="https://hackmd.io/_uploads/rkk43qckp.png" width = 400>
<img src="https://hackmd.io/_uploads/H114hccJ6.png" width = 400>
<img src="https://hackmd.io/_uploads/rkBl09cya.png" width = 400>




## 구조 설명


Model - View - Controller


### Model
- JuiceMaker
    - 사용자의 입력으로 주스를 만들어 주는 메소드들의 모음
    ``` swift 
    func startOrder(juiceTag: Int) throws {
        let fruitDict: [String: Int] = try orderConvertToDict(juiceTag: juiceTag)
        
        try checkStock(juiceIngredient: fruitDict)
        try makeJuice(juiceIngredient: fruitDict)

    }
    ```
    - enum Recipe
        - 각 주스들의 재료를 반환하고, 사용자의 입력을 tag로 분리하기 위해 선언한 열거형
        
- FruitStore
    - Fruit
        - 과일의 이름과 총 재고 갯수를 구조체로 선언.
    - 프로퍼티로 Fruit 배열을 가지고 있는다.
    - 재고관리View에서 과일의 재고를 변경해주는 메소드
    ```swift
    func addFruitStock(inputFruit: Fruit, count: Int) throws {
        
        guard let index = fruitList.firstIndex(where: {$0.name == inputFruit.name}) else {
            throw MessageLog.ErrorCase.canNotFound
        }
        
        fruitList[index].stock = count
    }
    
    ```
- MessageLog
    - 사용자에게 Alert으로 보여줄 메세지들 enum으로 모아놓은 NameSpace.
    - 에러처리를 AlertMessage로 재사용할 수 있게한 코드
    ```swift
        enum ErrorCase: Error, CustomDebugStringConvertible {
        
        case canNotFound
        case outOfStock
        case stepperTagError
        case failedOptionalBinding

        var debugDescription: String {
            switch self {
            case .canNotFound:
                return "해당 과일을 찾을 수 없습니다."
            case .outOfStock:
                return "재료가 모자라요. 재고를 수정할까요?"
            case .stepperTagError:
                return "일치하는 stepper의 태그가 없습니다."
            case .failedOptionalBinding:
                return "optional binding 실패"
            }
        }
    }
    ```
    
    
### Controller
- JuiceMakerViewController
    - 원하는 주스의 주문버튼 액션 구현
    - 버튼 클릭시 상황에 맞는 Alert 표시
    ``` swift
      @IBAction func orderJuice(_ sender: UIButton) {
        guard let juiceTag = JuiceMaker.Recipe(rawValue: sender.tag)  else { return }
        do {
            try juiceMaker.startOrder(juiceTag: juiceTag.rawValue)
            showingCompletedOrderAlert(juiceName: juiceTag.juiceName)
            try updateUI()
        } catch {
            showingOutOfStockAlert(error: error)
        }
        
    }
    ```
    - 데이터( 과일 재고) 연동
    ```swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            guard let fruitStoreViewController = segue.destination as? FruitStoreViewController else {
                print("\(segue.destination)")
                return}
            fruitStoreViewController.fruitStore = juiceMaker.fruitStore

        }
    ```
- FruitStoreViewControlle
    - Stepper를 이용한 재고관리 액션 구현
    ```swift 
    @IBAction func fruitStockStepper(_ sender: UIStepper) {
            do {
                guard let stepperTag = StepperTag(rawValue: sender.tag) else { return }

                guard let fruitStore = fruitStore else { return }

                guard let fruit = fruitStore.fruitList.filter({$0.name == stepperTag.fruitName}).first else { return }


                try fruitStore.addFruitStock(inputFruit: fruit, count: Int(sender.value))

                try updateUI()

            } catch {
                showingSystemAlert(error: error)
            }
        }
    ```
    
## Trouble Shooting
1. 두가지의 재료가 들어가는 주스는 어떻게 재고를 수정해줄 것인가?
    - 뭔가 CollectionType으로 해주면 좋을 것 같다.
    - 그래서 Key와 Value를 가지는 dictionary로 하면 좋을거 같다.
    - Key에는 과일종류, Value는 주스 만들때 필요한 재료를 Int값으로 관리해주면 좋을 것 같다.
    **Solution**
    ```swift
    enum Recipe: Int {
        
        case strawberryJuiceTag = 0
        case bananaJuiceTag = 1
        case pineappleJuiceTag = 2
        case mangoJuiceTag = 3
        case kiwiJuiceTag = 4
        case strawberryBananaJuiceTag = 5
        case mangoKiwiJuiceTag = 6
        
        var juiceIngredient: [String: Int] {
            switch self {
            case .strawberryJuiceTag:
                return ["딸기": 16]
            case .bananaJuiceTag:
                return ["바나나": 2]
            case .pineappleJuiceTag:
                return ["파인애플": 2]
            case .mangoJuiceTag:
                return ["망고": 3]
            case .kiwiJuiceTag:
                return ["키위": 3]
            case .strawberryBananaJuiceTag:
                return ["딸기": 10, "바나나": 1]
            case .mangoKiwiJuiceTag:
                return ["망고": 2, "키위": 1]
            }
            
        }
       
    }
        ```
2. stepper와 재고를 연동할시에 stepper의 값을 변하게 하면 재고의 값을 무시하고 0부터 시작한다.
    - steper의 기본 시작값을 0에서 과일의 재고 값으로 변경 
    ```swift
     private func initStepper() throws {
        guard let fruitStore = fruitStore else {throw MessageLog.ErrorCase.failedOptionalBinding}
        
        strawberryStepper.value = Double(try fruitStore.takeFruitStock(fruitName: "딸기"))
        bananaStepper.value = Double(try fruitStore.takeFruitStock(fruitName: "바나나"))
        pineappleStepper.value = Double(try fruitStore.takeFruitStock(fruitName: "파인애플"))
        kiwiStepper.value = Double(try fruitStore.takeFruitStock(fruitName: "키위"))
        mangoStepper.value = Double(try fruitStore.takeFruitStock(fruitName: "망고"))
    }
    ```


## 팀원
|범|밤삭|
|:--:|:--:|
|<img src="https://avatars.githubusercontent.com/u/118453865?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/114239407?v=4" width=200>|
