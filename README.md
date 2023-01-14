# 🧃ios-juice-maker
**[Step 1]** 쥬스 메이커 타입 정의<br>
**[Step 2]** 초기화면 기능 구현<br>
**[Step 3]** 재고수정, 알림창 기능 및 데이터 전달 구현<br>

<br>

## 📲 실행 화면
![iPhone14 실행 화면](https://user-images.githubusercontent.com/71758542/212254842-103d29d2-aee5-4df5-9095-7ef586578b8b.gif)
<br>
<br>

## 🔖 UML
<img width="3392" alt="JuiceMakerUML" src="https://user-images.githubusercontent.com/29590768/212476131-db8100cd-9b2d-4487-9f7c-023ab0ca2bd3.png">
<br>
<br>

## 📂 폴더 구조
![](https://i.imgur.com/EBqz4IP.png)
<br>
<br>

## ❗️ 타입별 역할 분배

| struct | 역할 |
| --- | --- |
| `Fruit` | - 과일들의 이름과 재고를 담고 있는 구조체  |
| `OrderMessage` | - 주문된 과일 이름과 필요한 양을 담고 있는 구조체 |
| `JuiceMaker` | - 주스를 만드는 함수를 가지고 있는 구조체|

| class | 역할 |
| --- | --- |
| `FruitStore` | - fruits : 과일들의 재고를 담는 변수<br>- increaseStock(of: by:) : 과일 재고를 변경(증가)하는 메서드<br>- dereaseStock(of: by:) :  과일 재고를 변경(감소) 하는 메서드<br>- checkStock(message:) : 레시피에서 요구하는 재료의 양보다 재고가 많은지를 확인하는 메서드 |

|Label Class|설명|
| --- | --- |
|`{과일명}StockLabel`|{과일명}Label 정의|
|**Stepper Button class**|**설명**|
|`{과일명}Stepper`|{과일명}Stepper 버튼 정의|
|**Order Button class**| **설명** |
|`{쥬스명}Button`|{쥬스명}Button 정의|

| enum | 역할 |
| --- | --- |
| `Errors` | - 에러정의 |
| `Fruits` | - 과일 종류 정의<br>- 10개씩 과일 초기화 메서드 |
| `Juices` | - 각 쥬스 이름 정의<br>- 쥬스들의 레씨피 정의 |
| `Messages` | - Alert에 노출될 메세지 정의 |

| protocol | 역할 |
| --- | --- |
| `FruitStockManagable` | - 재고관리에 관여할 수 있는 객체들의 준수사항 제공 |
| `JuiceOrderable` | - 유저의 주문을 받는 객체들의 준수사항 제공|

<br>

## [Step 1] 쥬스 메이커 타입 정의
📌 [PR #21 | JuiceMaker [STEP 1] Logan, Blue](https://github.com/tasty-code/ios-juice-maker/pull/21)

### ✅ 구현 요구사항
- FruitStore 타입 정의
    - 관리하는 과일: 딸기, 바나나, 파인애플, 키위, 망고
    - 과일의 초기 재고: 10개
    - 과일 수량변경 기능
- JuiceMaker 타입 정의
    - 레시피에 맞춰 과일주스 제조
    - 과일의 재고가 부족하면 쥬스 제조 불가
    - FruitStore를 소유하고 있음

### ☄️ 고민 및 해결

1. **`FruitStore`는 왜 class로 구현되어 있었을까?**
    과제를 처음 받았을 때 `class FruitStore {}` 형태로 구현이 되어있는 것을 보고 **singleton**으로구현할 것을 의도한 것이 아닌가! 하여 구현해 보려고 하였습니다.`FruitStore`를 singleton으로 사용하고자 한 이유는 아래와 같습니다.
    
    - 과일 재고 저장소이기 때문에 과일쥬스를 만들 때 과일을 가져다 써야 함
    - 과일의 재고를 추가하거나 감소시키는 기능이 있어야 함
    - 위의 기능을 수행할 때 `FruitStore`가 아닌 **외부에서 접근할 가능성**이 있고, 한 곳에서 재고가관리되어야 하므로, `singleton`으로 구현할 필요성 느낌

2. **`JuiceMaker`는 왜 struct로 구현되어 있는가?**
    아래의 구조체 사용 case 중 **다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때**에 해당한다고생각하여 struct로 구현되어 있는 것이라고 생각하였다.
    - 애플은 [가이드라인](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)에서 다음 조건 중 하나 이상에 해당한다면 구조체를 사용할 것을 권장함
        - 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
        - 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
        - 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
        - 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때

<br>

## [Step 2] 초기화면 기능 구현
📌 [PR #28 | JuiceMaker [STEP 2] Logan, Blue](https://github.com/tasty-code/ios-juice-maker/pull/28)

### ✅ 구현 요구사항
- 재고 수정 버튼에 재고추가 화면으로 이동하는 기능 구현
- 주문 버튼 터치 시
    - 재고가 있으면 →  “쥬스 나왔습니다! 맛있게 드세요!” 얼럿 표시
    - 재고가 없으면 → “재료가 모자라요. 재고를 수정할까요?” 얼럿 표시
        - 예 → 재고 수정 화면으로 이동
        - 아니오 → 얼럿 닫기
- 과일쥬스 제조에 따른 재고 변경사항 반영


### ☄️ 고민 및 해결
1. **화면 전환 방식으로 왜 `Modal 방식`을 사용하였는가?**
    - 기존에 제시됐던 힌트가 `EditStockViewController`도 네비게이션 방식을 사용하도록 설계되어 있었습니다.
    - 하지만 Modal 방식을 채택하였고, 이유는 아래와 같습니다.
        - ***“모달은 내비게이션 인터페이스 와는 달리 정보의 흐름이 아니라 단지 사용자로부터 입력을 받기위해 이목을 끄는 방식이다.”*** 라는 정의에 의거하여 재고를 수정하는 행위는 사용자의 간단한 입력으로 이뤄지기 때문
        - [Apple의 Human Interface Guideline](https://developer.apple.com/design/human-interface-guidelines/patterns/modality)에 따르면 **“Aim to keep modal tasks simple, short, and narrowly focused.”** 에 명시되어 있는 것처럼 ‘재고 수정’은 작업의 범위가 단순하고 좁은 범위의 편집이기 때문
        - **”Help people perform a distinct, narrowly scoped task without losing track of their previous context”,** 사용자들이 이전 컨텍스트를 잃지 않고 명확하고 좁은 범위의 작업을 수행하여야 한다는 HIG에 지침에 따라, ‘재고 수정’ 작업은 이전 화면의 컨텍스트를 잃지 않고 작업이 수행되어야하기 때문

<br>

## [Step 3] 재고수정 및 데이터 전달
📌 [PR #38 | JuiceMaker [STEP 3] Logan, Blue](https://github.com/tasty-code/ios-juice-maker/pull/38)

### ✅ 구현 요구사항
- 화면 제목 '재고추가' 및 '닫기' 버튼 구현
    - 닫기 터치 시 이전화면으로 복귀
- 재고추가 화면 진입 시 과일의 현재 재고 수량 표시
- +, -를 통한 재고 수정
- iPhone12 외에 다른 시뮬레이터에서도 UI가 정상적으로 보일 수 있도록 오토 레이아웃 적용

### ☄️ 고민 및 해결

1. STEP2에서는 label 및 stepper를 하나씩 Outlet으로 선언 후 연결하여 사용하였습니다.
    선언부가 반복되는 문제를 개선하기 위해 `Outlet Collection`으로 개선해 보았습니다!
    
    ⏪ **ViewController.swift**의 기존 label 선언부 코드
    ```swift
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    ```
    ⏩ **Outlet Collection**으로 수정

    ```swift
    @IBOutlet var fruitStockLabels: [UILabel]!
    ```
2. `protocol`을 이용하여 클래스로 정의되고 Collection으로 엮인 버튼들을 하나로 관리 해주었습니다.

    🔍 **Protocols.swift**
    ```swift
    protocol FruitStockManagable {
        var fruitName: Fruits { get }
    }

    protocol JuiceOrderable {
        var juice: Juices { get }
    }
    ```
    위의 두 `FruitStockManagable`, `JuiceOrderable`은 각 버튼들의 정체성을 확인하는데 꼭 필요한 요소들을 요구사항으로 정의하고 있습니다.
    
    🔍 **FruitLabels.swift, FruitSteppers.swift, JuiceOrderButtons.swift**
    ```swift
    // JuiceMakerVC의 재고를 나타내는 라벨의 클래스 정의중 "딸기"
    class StrawberryStockLabel: UILabel, FruitStockManagable {
    var fruitName: Fruits = .strawberry
    
    // JuiceMakerVC의 주문 버튼 중 "딸기바나나쥬스"
    class StrawberryJuiceButton: UIButton, JuiceOrderable {
    var juice: Juices = .strawberry
    }
    // EditStockVC의 재고 수정하는 버튼 StepperButton의 정의중 딸기 부분
    class StrawberryStepper: UIStepper, FruitStockManagable {
    var fruitName: Fruits = .strawberry
        }
    }
    ```
    

4. Alert 띄우는 메서드를 하나로 통합하였습니다.
   - 기존에는 선택지가 1개인(예) 알림창과 선택지가 2개인(예 / 아니오) 알림창을 두개 따로 선언하여 동작했지만 같은 작업을 하는 메서드가 2개인것이 바람직 하지 않다고 생각하여 이후 리팩토링 작업에서 하나로 통합하였습니다.

    🔍 **ViewController.swift**
    ```swift
    private func popAlert(with message: String?, error: Error?) {
            if message != nil && error != nil { return }

            if let message {
                let alert = UIAlertController(title:  message, message: nil, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
                present(alert, animated: true)
            }

            if let error {
                let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "예", style: .default, handler: {_ in
                    self.moveToEditStockView()}))
                alert.addAction(UIAlertAction(title: "아니오", style: .destructive, handler: nil))
                present(alert, animated: true)
            }
        }
    ```

    
    
<br>

## 🗝️ 학습 키워드

- string.index
- enum - rawValue의 사용
- Singleton
- 에러 핸들링 (`do-catch`, `try`)
- Navigation bar item
- Alert controller
- Modality
- Auto Layout
- Custom Class
- Outlet Collection
- Type Casting
- Stepper

<br>

## 💙 Team Bu-Lo 🍀
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `23.01.02` ~ `23.01.13`

|<img src="https://avatars.githubusercontent.com/u/71758542?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/29590768?v=4" width=200>|
|:---:|:---:|
|[💙 Blue 💙](https://github.com/bomyuniverse)|[🍀 Logan 🍀](https://github.com/sloDevz)|
