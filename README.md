# Sesac 쥬스메이커 프로젝트
- 팀원: [Mason](https://github.com/qwerty3345), [Miro](https://github.com/longlivedrgn)
- 프로젝트 기간: 23.01.02 ~ 23.01.13



# 📱 동작 화면
![ezgif com-gif-maker-2](https://user-images.githubusercontent.com/59835351/212239510-48a183ad-c348-4382-8988-eb648582eca0.gif)



# 📝 객체별 역할과 책임

| Name | Type | 역할과 책임 |
| --- | --- | --- |
| JuiceMaker | struct | FruitJuice를 제조하는 쥬스메이커 |
| FruitStore | final class (싱글턴) | Fruit의 재고를 관리하는 싱글턴 객체 |
| Fruit | enum |  과일의 종류 |
| FruitJuice | enum | 과일 쥬스의 종류  (제조 레시피를 [Fruit:Int] 형태로 가짐) |
| StockError | enum | 재고 관련 Error |
| Constants | enum | 스토리보드 ID값, 유저메시지, 디자인(UI), 매직넘버 등의 상수값을 static let 으로 묶어서 관리 |
| JuiceViewController | final class | 과일쥬스 제조의 역할을 하는 뷰컨트롤러 (JuiceMaker를 가짐) |
| StockViewController | final class | 과일의 재고를 관리하는 뷰컨트롤러 (싱글턴 FruitStore를 참조) |

![JuiceMaker_클래스다이어그램-최종-2](https://user-images.githubusercontent.com/59835351/212346337-e4bbbb69-59c4-478d-87e4-503b62133017.jpg)



# **⁉️ 고민과 해결 - [STEP 1]**

### 1. 클래스, 구조체 중 어떤 걸 선택해야 할까? (FruitStore, JuiceMaker)

- `FruitStore`
    - 내부에 과일 재고에 해당하는 딕셔너리 데이터를 갖고 있고, 해당 데이터를 수정하는 역할을 수행
    - 데이터를 갖고 있고, 계속해서 해당 데이터를 수정해야 하며 해당 데이터의 identity 를 유지해야 한다면`class` 로 구현하는 것이 적절하다 판단 (이후 STEP 에서 싱글톤 패턴 선택)
- `JuiceMaker`
    - 쥬스를 만드는 역할을 하고, 실질적인 속성(과일 재고)에 대한 변경은 `FruitStore` 에게 위임하므로 구조체로 구현하는 것이 적절하다 판단

### 2. `enum Fruit` 와 `enum FruitJuice` 의 case 명이 겹치는 문제

- 두 가지의 enum 을 동시에 사용할 때, case 가 겹칠 시에 대한 해결책을 아래와 같이 고민
1. FruitJuice의 case 이름을 .strawberryJuice 로 쥬스라는 걸 명시해준다
2. 동시에 사용하는 경우, 한 쪽의 enum을 Fruit.strawberry 로 풀어쓴다

**🌟 리뷰어 의견:** 1번은 enum 명과 case 가 juice 로 겹치니, 2번처럼 Fruit.strawberry 라고 명시적으로 적어서 헷갈림을 방지하는 것이 좋을 듯 하다!

```swift
enum Fruit: CaseIterable {
    case strawberry
    case banana ...

enum FruitJuice {
    case strawberry
    case banana
    case strawberryBanana ...
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [Fruit.strawberry: 16]
        case .banana:
            return [Fruit.banana: 2]
  ...
```

### 3. `.allSatisfy` 내부에서 옵셔널 바인딩 처리

- 재고 수량이 충분한지 확인하는 hasEnoughStock 함수를 사용할 때,
전체 조건을 확인하는 `.allSatisfy` 의 내부에서 어떻게 옵셔널 바인딩을 처리 할 것인가?
- `.allSatisfy` 클로저 내부에서 작성하는 return 은 함수의 return 이 아니라,
파라미터로 받는 조건을 체크하는 클로저의 return 이므로, 각기 return 으로 처리 가능
    - `func allSatisfy(_ predicate: (Self.Element) throws -> Bool) rethrows -> Bool`

```swift
private func hasEnoughStock(for fruitJuice: FruitJuice) -> Bool {
    return fruitJuice.recipe.allSatisfy { fruit, numberOfUse in
        guard let fruitStock = fruitStore.stock[fruit] else {
            return false
        }
        return fruitStock >= numberOfUse
    }
}
```

- 더욱 간단히, 해당 로직은 수량을 체크하는 것이므로 nil일시, 재고 수량을 0으로 nil coalescing 처리함

```swift
private func hasEnoughStock(for fruitJuice: FruitJuice) -> Bool {
    return fruitJuice.recipe.allSatisfy { fruit, numberOfUse in
        (fruitStore.stock[fruit] ?? 0) >= numberOfUse
    }
}
```

### 4. `CaseIterable` 프로토콜 채택을 통한 `Fruit.allCases` 사용

- `FruitStore` 객체 생성 시 initializer를 통하여 `FruitStore` 프로퍼티 stock의 기본 재고값을 `[Fruit:Int]`로 각 과일별로 10개만큼 채워 넣기 위하여 `allCases` 메소드를 사용
- 열거형 타입을 배열처럼 사용하기위해서는 enum에 `CaseIterable` 프로토콜을 채택

### 5. 에러 핸들링 시 고차함수의 try, try 구조

- 쥬스 생성 시 내부에서 에러를 던질 수 있는 `changeStock(of:by:)` 함수를 
고차함수 (forEach) 에서 호출하니, try 고차함수 { try 함수 } 형식으로 중첩해서 try 를 해줘야 했음

```swift
// struct JuiceMaker
func makeJuice(of fruitJuice: FruitJuice) throws {
    guard hasEnoughStock(for: fruitJuice) else {
        throw StockError.notEnoughToMakeJuice
    }

    try fruitJuice.recipe.forEach { fruit, numberOfUse in
        try fruitStore.changeStock(of: fruit, by: -numberOfUse)
    }
}
```

**🌟 리뷰어 의견:** 해당 코드를 고차함수가 아닌 반복문을 사용하는걸 추천.
고차함수는 순수함수(pure function)를 인자로 받아야 하는데 현재 클로져 코드가 순수하지 않기 때문. 
내용이 순수하지 않으면 for 문을 쓰는게 정석이다.

→ 아래와 같이 for 문 안에 try 구문이 있게 변경하였다.

```swift
// struct JuiceMaker
func makeJuice(of fruitJuice: FruitJuice) throws {
    guard hasEnoughStock(for: fruitJuice) else {
        throw StockError.notEnoughToMakeJuice
    }

		for (fruit, numberOfUse) in fruitJuice.recipe {
         try fruitStore.changeStock(of: fruit, by: -numberOfUse)
        }
    }
```

# **⁉️ 고민과 해결 - [STEP 2]**

### 1. 뷰 컨트롤러 간의 데이터 공유/전달 방법?

- 뷰 컨트롤러 간의 데이터 전송 및 공유 방법 고민
    - Delegate pattern, 프로퍼티를 통한 전달, Notification center, 클로저를 통한 전달 등을 고민
- 여러 방법을 검토한 결과 **싱글턴**을 활용하여 FruitStore 데이터를 공유하는 방식이 적절하다는 생각이 들었다.

```swift
final class FruitStore {
    static let shared = FruitStore()
    
    private(set) var stock: [Fruit: Int] = [:]
...
}
```

- 그러나 싱글턴으로 구현을 한 경우,  Unit Test를 진행함에 있어서 불편한 점이 있었습니다.
- 하나의 객체를 전역적으로 공유하기에 아래와 같이 매번 새로운 SUT 객체를 생성하고 nil로 해제하여 초기화를 해주는 것이 아닌, 직접 저희가 초기값을 설정 해 주어야 하는 단점이 있었다.

**🌟 리뷰어 의견**: reset 이라는 메소드를 FruitStore에 추가해서 보일러플레이트 줄여보시면 될 듯 하다! 싱글톤의 단점이 맞긴하지만, FruitStore가 여러 화면에서 사용할 수 있는 객체로 보이기에 싱글톤을 쓰는 게 더 이득일 듯!

→ 아래와 같은 resetStockValue()함수를 정의하여 test할 때마다 호출하는 방식으로 해결하였다. 

```swift
// FruitStore.swift
func resetStockValue() {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = Constants.Number.initialFruitStockQuantity
        }
```

### 2. Constants enum 속 상수명에 대한 고민

- 전체 프로젝트에서 사용되는 하드코딩 되어있던 상수값들을 `Identifier`, `UserMessage`, `Design`, `Number`로 나누고 enum 타입의 `Constants` namespace 로 묶어주었다.

```swift
enum Constants {
		enum Identifier {
				static let stockViewController = "StockVC"
		}

		enum UserMessage {
	      static let servingJuiceExtra = "맛있게 드세요!"
	      static let servingJuiceConfirm = "잘 먹을게요!"
	      static let failedJuiceConfirm = "네"
	      static let failedJuiceCancel = "아니요"
	  }

		enum Design {
        static let stockViewControllerNavigationTitle = "과일 재고 수정"
    }
    
    enum Number {
        static let initialFruitStockQuantity = 10
    }
}
```

- 위의 코드 속 UserMessage의 경우, 상수명을 역할을 기준으로 명명해야되는 지, 아니면 의미를 기준으로 명명해야되는 지 *고민*하였다.
- 아래의 코드는 해당 String의 `역할`을 표현하는 이름으로 상수명을 설정한 케이스이다.

```swift
static let servingJuiceConfirm = "잘 먹을게요!"  // 선택 한 방식
```

- 반면, 아래의 경우는 해당 값의 `의미`를 그대로 전달하는 이름으로 상수명을 설정한 케이스이다.

```swift
static let thanksForServing = "잘 먹을게요!"  // 선택하지 않았지만, 고민 한 방식
```

🌟 **리뷰어 의견**: 역할을 중점으로 둬서 상수명을 설정하는 게 더 좋을 듯! ex) `confirm`, `cancel`

### 3. JuiceViewController의 재고 Label 업데이트는 언제 해줘야할까?

- `StockViewController` 에서 스테퍼로 재고를 수정한 뒤, `JuiceViewController`로 돌아왔을 때 수정한 재고값을 가져와 Label 들에 표시 해 주는 방식으로 로직을 구성하였다.
- 그리하여, `updateAllStockLabels()` 함수를 viewWillAppear 에서 호출하도록 구현하였다.
- 이러한, 방식이 야기할 수 있는 문제는 두 가지가 있다고 생각이 들었다.
    1. JuiceViewController와 연결된 ViewController가 여러 개일 경우.
    - 현재 JuiceViewController와 연결 된 viewController는 StockViewController 뿐입니다. 그러나, JuiceViewController가 stockLabel과 관련되지 않은 viewController들과도 연결되어있을 경우, 해당 viewController를 왔다갔다 할 경우 불필요하게 updateStockLable(of:)가 호출되는 상황이 발생할 것이라는 생각이 들었다.
    1. StockViewController에서 재고 수정을 하지 않을 경우.
    - StockViewController에서 아무런 재고 수정을 하지 않고, JuiceViewController로 pop이 될 경우, (만약에 재고 데이터를 받아오는 과정이 네트워킹이 필요 해 시간이 오래걸리는 작업이라면…) updateStockLable(of:)를 하지 않게 처리해야 할 필요가 있다고 느꼈다.

🌟 **리뷰어 의견**: 위와 같은 문제는 viewWillAppear를 통하여 함수를 호출할 때 생길 수 있는 문제이다! 따라서 delegate 패턴을 통하여 로직을 구현하는 게 좋을 듯 싶다!

→  재고 변경이 되었는 지 아닌 지를 `isStockChanged` 를 통하여 확인하고, `StockViewControllerDelegate` protocol을 통하여 delegate 패턴을 구현하였다.

### 4. Outlet Collection에서 특정 레이블을 가져오는 방식

> 1 → 2 → 3 → 4 의 순서로 고민하며 리팩터링을 진행
> 
1. 스토리보드에서 모든 요소를 각각 연결시키는 방식
2. tag & enum 의 rawValue 를 쓰는 방식
3. tag & enum 의 custom init 방식
4. custom Class 와 protocol 을 채택하여 구현하는 방식 → tag, rawValue 를 쓰지 않음

**[ 1 → 2 ]**

- 처음엔 각각 IBOutlet 을 연결 해 줬으나, Outlet Collection 이 존재함을 알고 방식을 변경하며 tag를 활용함
    - 재고 레이블 배열의 전체 레이블을 한 번에 업데이트 할 때는 for 문으로 쉽게 처리할 수 있지만, 
    특정 쥬스를 제조한 후에는 해당 레시피의 재고를 수정한 Fruit 만 업데이트 하게끔 처리하고자 했음
    - 이를 위해, 해당 label의 tag 숫자를 아래와 같이 enum의 rawValue 값과 동일하게 설정하여 해당 버튼이 어떠한 Fruit와 연결되었는 지 알 수 있게 함

> **🌟 리뷰어 의견:** Fruit의 rawvalue와 tag 값과 아무런 관련이 없는데 tag 값을 rawValue에 넣어 Fruit 객체를 만드는 것은 어색함. custom init 으로 tag 값을 넣는 것이 더 적절 해 보임.
> 

**[ 2 → 3 ]**

- tag 값에서 매칭되는 enum 을 생성할 때, rawValue 로 생성하는 방식에서 custom init 으로 생성하게끔 처리함

> **🌟 리뷰어 의견:**
tag를 쓰지말고 button들의 Custom Class 로 구현하는 것이 좋을 듯 함.
tag는 동적으로 생성된 뷰를 취급할 때 방법이 없을때 사용하기 좋은 값이지, 지금처럼 이미 화면에 보이는 버튼들에 사용하기 좋은 방법은 아님
tag를 사용하면 앱은 tag를 통해 런타임적으로 어떤 뷰인지 판별하기에 이미 알고 있는 뷰라면 tag를 쓰는 것이 비효율적이다.
> 

**[ 3 → 4 ]**

- 활용하고자 하는 프로퍼티, 메서드를 요구사항으로 갖는 protocol 과 
해당 protocol 을 채택한 버튼, 레이블, 스테퍼의 Custom Class 를 각각 생성하고 런타임에 타입캐스팅 후 요구사항 프로퍼티에 접근하여 사용

```swift
protocol JuiceButtonProtocol {
    var fruitJuice: FruitJuice { get }
}
final class StrawberryButton: UIButton, JuiceButtonProtocol {
    var fruitJuice: FruitJuice = .strawberry
}

// ViewController
@IBAction private func tappedJuiceOrderButton(_ sender: UIButton) {
    guard let button = sender as? JuiceButtonProtocol else { return }
    let fruitJuice = button.fruitJuice
...
```

> Q. protocol 로 구현했기 때문에 runtime 에 type casting 을 하는 과정이 있는데 해당 과정의 비용은 크지 않을까?
> 

**🌟 리뷰어 의견:** type casting 때문에 발생하는 비용은 앱 운영하는데 그렇게 크지 않을걸로 판단 됨.
type casting 을 피하려면 직접 코드로 구현을 하는것도 괜찮을 것 같다.

### 5. 화면 전환 방식 - 네비게이션 VS 모달

- 기존에 네비게이션 방식을 선택하여 구현
    1. 가로 모드에서의 모달 방식의 경우, 스와이프 액션이 불가능하고 따로 버튼을 만들어주어야 했음
    2. 네비게이션 방식의 왼쪽 스와이프 모션을 통하여 손쉽게 재고 수정 Scene에서 쥬스 만드는 Scene으로 이동할 수 있게 구현하기 위하여 네비게이션 방식을 채택하였습니다.
- 그러나, HIG를 공부하며 고민 해 보니
    - `네비게이션`의 경우, 정보의 깊이와 흐름을 갖고 더 깊게 들어가는 설정의 형태를 가질 때에 적합한 방식
    - `모달`의 경우, 이용자가 흐름에서 잠깐 벗어나게 하는 목적으로 사용됨
    - 재고 수정의 경우, 흐름에서 잠깐 벗어나는 행위이므로 `모달`의 방식이 의미에는 좀 더 적합할 것이라 판단

**🌟 리뷰어 의견:** HIG의 기준으로 애니메이션을 선택해야 함. 모달이 더 어울릴 듯 하다.

# **⁉️ 고민과 해결 - [STEP 3]**

### 1. 델리게이트 패턴의 weak 키워드 사용

- 많은 예시에서 델리게이트 패턴에 weak 키워드를 사용하고, weak 키워드를 사용하면 RC 를 증가시키지 않기에 순환참조를 방지할 수 있음
- 이번 프로젝트의 구조에서는 순환 참조가 일어나지 않음을 확인 하였으나, 여러 글을 읽으며 현재까지 내린 결론은 아래와 같기에 이번 프로젝트에도 weak 키워드를 붙여줌

> delegate 에 왠만하면 `weak`를 붙이고, 클로저가 `self`를 캡쳐할 때도 `weak self` 를 붙이자.
(당장은 순환참조가 일어나지 않을 수도 있지만, 추후 유지보수 시 어떻게 될지도 모르고 그 순간을 확신할 수 없기에!)
> 

**🌟 리뷰어 의견:** (추가 예정)

### 2. 모달 속 navigation bar?

- 기존 navigation 방식의 구현에서 modal 방식으로 화면 이동 방식 변경
구현 중, 프로젝트 요구사항 페이지 속 재고 수정 화면에 navigation bar와 비슷한 UI 요소를 구현해야 했음 (다만 네비게이션과 같은 백바버튼은 존재 X)
- 모달 방식을 선택하며 스토리보드의 StockVC Scene에 navigation bar Component를 요소로 추가해주는 방법으로 화면을 구성함

**🌟 리뷰어 의견:** (추가 예정)
