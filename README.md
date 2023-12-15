
### 파일 구조

<pre>

JuiceMaker-iOS/
│
├── View/
│   └── JuiceMachineView.swift
│
├── ViewController/
│   └── JuiceMachineViewController.swift
│
└── Model/
     ├── Reception.swift
     ├── JuiceType.swift
     ├── Juicemaker.swift
     ├── FruitStore.swift
     └── ErrorType.swift

</pre>

### 다이어그램

```swift
+------------------------------------+
|           JuiceMachineView         |
+------------------------------------+
       ^  
       |  
+------------------------------------+
|     JuiceMachineViewController     |
+------------------------------------+
       |
       V
+------------------------------------+
|             Reception              |
|------------------------------------|
| - juiceMaker: JuiceMaker           | ------------
| - acceptJuiceOrder()               |            |
+------------------------------------+            |
       |                                          |
       V                                          |
+------------------------------------+            |
|             JuiceMaker             |            |
|------------------------------------|            |
| - fruitStore: FruitStore           |            |
| - makeJuice()                      |            |
+------------------------------------+            |
       |                                          |
       V                                          |
+------------------------------------+            |
|             FruitStore             |            |
|------------------------------------|            |
| - fruits: Fruits                   |   <---------
| - fruitsStock: [Fruits: Int]       |
| - increment(fruit: Fruits)         |
| - decrement(fruit: Fruits)         |
+------------------------------------+
```

<br/>

#

### 고민1.  요구사항에 따라 어떤 객체가 꼭 필요할까?

- UIComponent 객체 → `@IBOutlet`, `@IBAction`
- 주문 처리 → `Reception`
- 쥬스 레시피 → `JuiceMaker`
- 과일 재고 → `FruitStore`
#

### 고민2. 객체간의 연결관계를 가장 느슨하게 연결할 수 있는 방법이 있을까?

- 단방향 의존성 설정
- `JuiceMachineViewController` → `Reception` → `JuiceMaker` → `FruitStore`
- `Fruitstore`와 `JuiceMachineViewController`  의 데이터 바인딩(과일재고)은 notification center를 이용해 구현

#

### 고민3. 뷰컨에서 음료수 주문하는 코드를 어떻게 하면 글을 읽듯이 코드가 읽힐 수 있을까?
- 클린코드를 위한 함수 네이밍 고려하기
- **함수는 주로 동사구의 구조를 가지게된다!** <br/>
  -> 타동사 + 목적어: 함수명이 타동사, 아규먼트가 명사라면 와일드카드 패턴을 이용해 아규먼트레이블을 없애준다 <br/>
  -> 자동사 + 전치사구: 함수명이 자동사, 아규먼트가 명사라면 아규먼트레이블에 전치사를 넣어준다 <br/>

```swift
//선언
func increment(fruit type: Fruits, by quantities: Int) { ... }
func decrement(fruit type: Fruits, by quantities: Int) { ... }
```
```swift
//사용
func makeStrawberryJuice() {
    fruitStore.decrement(fruit: .strawberry, by: 16)
}
    
func makeBananaJuice() {
    fruitStore.decrement(fruit: .banana, by: 2)
}
```


<br/>

#

### 트러블슈팅01. 과일재고의 데이터 바인딩이 되었음에도 버튼을 눌렸을 때 줄어들지 않았다! -> 의존성 주입을 통해 해결!

- 노티피케이션 센터를 통해 데이터바인딩을 했음에도 과일 재고가 줄어들지 않았다
- 메모리주소를 찾는 코드를 통해 FruitStore가 서로 다른 메모리 주소를 참조하고 있음을 확인!
- 의존성 주입을 통해 같은 FruitStore 메모리 주소를 참조할 수 있도록 코드 수정

```swift
//객체의 메모리 주소 찾기
func address(of object: UnsafeRawPointer) -> String{
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}
​
//same memory address
var a = [1, 2, 3]
var b = a
address(of: &a) //0x600002b74c20
address(of: &b) //0x600002b74c20
​
b.append(2)
address(of: &a) //0x600002b74c20
address(of: &b) //0x600001d509d0
```

#### 문제코드

```swift
//JuiceMaker.swift
struct JuiceMaker {
    let fruitStore = FruitStore()
    ...
}

//Reception.swift
struct Reception {   
    var juiceMaker = JuiceMaker()
    let fruitStore = FruitStore()
    ...
} 
```

#### 해결코드

```swift
//JuiceMaker.swift
struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }

    ...
}

//Reception.swift
struct Reception {
    
    var juiceMaker: JuiceMaker
    let fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore()
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }

    ...
}
```

<br/>

#

### 트러블슈팅02. 디미터 법칙을 위반한 코드 작성 

#### 디미터 법칙과 기차충돌
1. **`디미터의 법칙`** Law of Demeter
    
    > 모듈은 자신이 조작하는 객체의 속사정을 몰라야 한다. 
    객체는 자료를 숨기고 함수로 공개해야 한다.
    > 
    
    → 조회 함수로 **내부 구조를 공개하면 안 된다**는 의미!
    
    <aside>
    👌🏻 지키려면? <br/>
    1. 객체 자신을 호출 <br/>
    2. 메서드의 파라미터로 들어온 외부 객체의 메서드만 호출 <br/>
    3. 메서드에서 생성한 객체의 메서드만을 호출 <br/>
    4. 객체의 스코프 내에 있는 객체만을 호출 <br/>
        = Each unit should have only limited knowledge about other units <br/>
        : only units "closely" related to the current unit. <br/>
    
    </aside>
    
2. **`기차 충돌`** Train Wreck 
    
    : 여러 객체가 한 줄로 이어진 기차처럼 보이는 코드  `디미터의 법칙 위반`
    
    → 연쇄적으로 다른 메서드를 호출
        **자기 자신이 아닌 다른 객체의 호출을 연결**한 것 (메서드 체이닝과 다름)

#### 문제코드
```swift
func getFruitsStock(fruit: FruitStore.Fruits) -> Int {
    switch fruit {
    case .banana:
        return juiceMaker.fruitStore.fruitsStock[.banana] ?? 0
    ...
}
```
- 위코드는 두 가지 문제점을 가지고 있다. 첫번째 디미터법칙을 위반하여 객체간 결합성을 강화시키고 있고 두번째 `get` 키워드가 함수네이밍에 들어가 애플의 네이밍 가이드라인을 위반하고 있다
- 문제해결을 위해 위 함수를 삭제하고 뷰컨과 `fruitStock`의 데이터 바인딩을 해주었다.

<br/>

#

### 트러블슈팅03. 매직넘버 설정

- 매직넘버란 의미있는 이름의 상수로 대체될 수 있는 숫자를 의미한다
- 숫자 대신 상수로 표현해줌으로써 휴먼에러를 최소화하고 읽기쉬운 코드를 작성할 수 있다

#### 문제코드

```swift
fruitsStock = Dictionary(uniqueKeysWithValues: Fruits.allCases.map {($0, 10)})
```

#### 해결코드

```swift
let initialValue = 10
fruitsStock = Dictionary(uniqueKeysWithValues: Fruits.allCases.map {($0, initialValue)})
```
