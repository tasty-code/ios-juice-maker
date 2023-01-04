안녕하세요 소대!\
이번 프로젝트를 함께 진행하게된 JoJo, Is 입니다.\
새해 복 많이 받으세요 🙏

2023년 첫 리뷰어로 소대를 만나게 되어서 반갑습니다!\
저희의 코드가 아직 많이 부족하지만 리뷰해주시는 부분 열심히 보강해서 Step이 진행될때마다 성장하고 싶어요🔥\
어떤 생각이든 피드백이라면 무조건 좋아하니까 편하게 리뷰해주세요!!


## ‼️ 요구 사항 및 구현 사항
### 🙋‍♂️ 각 객체 별 책임
| Name | Type | 책임 |
| -- | -- | -- |
| Fruit | enum | FruitStore가 저장하는 Element이자 Juice의 재료인 과일 목록 |
| Storing| protocol | Element를 저장할 수 있는 Storing 청사진 
| FruitStore | final class | Fruit 창고 객체 |
| Juice | enum | Fruit가 재료인 주스 목록 |
| JuiceMaker | struct | Juice를 만드는 객체 |
| JMError | enum | JuiceMaker 관련 Error 목록 |

> **FruitStore는 다음의 조건을 충족해야합니다**
### 🍎 Fruit
> **FruitStore가 관리하는 과일의 종류 : 딸기, 바나나, 파인애플, 키위, 망고**
```swift
enum Fruit: CaseIterable {
    case strawberry
    // ...
}
```
- 관리하는 과일 종류가 정해져있기에 enum으로 Fruit을 정의했어요
- FruitStore에서 각 과일의 초기 재고를 편하게 설정하기 위해 CaseIterable 프로토콜을 채택했어요

> **각 과일의 초기 재고 : 10개** \
> **각 과일의 수량 n개를 변경하는 기능이 있습니다**
### 📦 Storing
```swift
typealias Storeable = Hashable & CaseIterable

protocol Storing {
    associatedtype Element: Storeable
    
    var items: [Element: Int] { get }
    
    mutating func add(item: Element, count: Int)
    mutating func subtract(pairOfItems: [Element: Int])
    func hasEnough(pairOfItems: [Element: Int]) -> Bool
}

extension Storing {
    func hasEnough(pairOfItems: [Element: Int]) -> Bool {
        //..
    }
}
```

- protocol을 공부해보고 싶어서 Storing이라는 프로토콜을 프로젝트에 도입했어요
- 실제로 구현해야 하는 구체적인 타입인 과일 저장소를 추상화 시켜 하나의 저장소 프로토콜을 만들었어요
- 저장소는 Storeable(저장할 수 있는?)한 Element라면 무엇이든 저장할 수 있도록, Generics을 도입해 표현했어요
- 특정 아이템의 재고가 충분한지 확인하는 hasEnough method는 Storing을 conform한 구체 타입의 저장 프로퍼티를 수정하지 않기 때문에 extension의 default implementation으로 구현할 수 있다고 생각했어요
- FruitStore의 Fruit이 CaseIterable이기 때문에 Storeable은 Hashable & CaseIterable한 타입으로 설정했어요

### 🏬 FruitStore
```swift
final class FruitStore: Storing {
    private(set) var items: [Fruit : Int] = [:]
    
    init(defaultStock count: Int) {
        for fruit in Fruit.allCases {
            add(item: fruit, count: count)
        }
    }
    // ...
}
```

- FruitStore는 Storing 프로토콜을 conform하고 Element는 Fruit이예요
- FruitStore을 초기화할 때 각 Fruit을 돌면서 defaultStock만큼 재고를 채워요
- `각 과일의 수량 n개를 변경하는 기능`이라는 요구 사항을 n개로 설정하는 것이 아니라 n개를 더하거나 뺀다고 생각했기에, add, subtract 메서드를 구현했어요

> **JuiceMaker.swift 파일에 다음의 조건을 충족하는 JuiceMaker 타입을 정의합니다**
> - FruitStore의 과일을 사용해 과일쥬스를 제조합니다<br>
>   - 딸기쥬스 : 딸기 16개 소모
>   - 바나나쥬스 : 바나나 2개 소모
>   - 키위쥬스 : 키위 3개 소모
>   - 파인애플 쥬스 : 파인애플 2개 소모
>   - 딸바쥬스 : 딸기 10개 + 바나나 1개 소모
>   - 망고 쥬스 : 망고 3개 소모
>   - 망고키위 쥬스 : 망고 2개 + 키위 1개 소모
### 🥤 Juice
```swift
enum Juice {
    case strawberryJuice
    // ...

    var ingredients: [Fruit: Int] {
        // ...
    }
}
```
- Juice의 종류 역시 enum으로 정해줬어요
- Juice의 ingredicents 속성을 통해 쥬스 별 재료와 필요한 개수를 담은 Dictionary를 알 수 있어요


> 과일의 재고가 부족하면 과일쥬스를 제조할 수 없습니다 \
> JuiceMaker는 FruitStore를 소유하고 있습니다    

### 👩‍🌾 JuiceMaker
```swift
struct JuiceMaker<T:Storing> where T.Element == Fruit {
    private(set) var fruitStore: T
    
    mutating func make(juice: Juice) throws -> Juice {
        let ingredients: [Fruit: Int] = juice.ingredients
        guard fruitStore.hasEnough(pairOfItems: ingredients) else {
            throw JMError.outOfStock
        }
        self.fruitStore.subtract(pairOfItems: ingredients)
        
        return juice
    }
}
```
- JuiceMaker의 make함수는 다음과 같아요
  - Juice 타입 매개 변수인 juice를 받아요 
    - juice는 viewController에서 눌린 버튼에 따라 만들어서 던질 예정이예요
  - Fruit만 저장할 수 있는 Storing 프로토콜을 conform하는 fruitStore를 소유하고 있어요
  - 싱글톤이 아니라 그 대안 중 하나인 의존성 주입을 사용 및 공부해보고 싶어서 Protocol과 Generic을 이용했어요
  - juice의 재료를 확인한 후 창고에서 재료들이 충분한지 확인해요
    - 충분하지 않으면 재고 없다는 오류를,
    - 충분하다면 창고에서 재료를 줄인 후 쥬스를 반환해요


## 고민한 부분

### FruitStore
- 과일 재고 관리
  - 과일과 과일수량의 값을 매칭하여 관리하기 위해 Dictionary를 사용하였습니다.
  - `Key: 과일` `Value: 수량`
- 과일수량 초기값 설정
  - 과일별로 초기값을 지정하기 위해 `CaseIterable`프로토콜의 `allCases`를 활용하여 설정하였습니다.
- add 함수 관련
  - Dictionary의 subsript의 반환값이 `oprional`로 반환되어 초기에는 `guard let` 바인딩을 통해 해결했습니다.
  - 하지만, guard let 바인딩으로 처리하면 else 구문을 처리하여야 하는데 앞선 input값을 check함수를 통해 정제하므로 실행될 일이 없다고 판단하였습니다.
  - 다른 방법을 찾던중 `default` 구문을 발견하여 적용하여 봤습니다.
- subtract 함수 관련
  - 
