안녕하세요 소대!\
이번 프로젝트를 함께 진행하게된 JoJo, Is 입니다.\
새해 복 많이 받으세요 🙏

2023년 첫 리뷰어로 소대를 만나게 되어서 반갑습니다!\
저희의 코드가 아직 많이 부족하지만 리뷰해주시는 부분 열심히 보강해서 Step이 진행될때마다 성장하고 싶어요🔥\
어떤 생각이든 피드백이라면 무조건 좋아하니까 편하게 리뷰해주세요!!

ㅤ

## ‼️ 요구 사항 및 구현 사항

### 🙋‍♂️ 각 객체 별 책임

| Name | Type | 책임 |
| -- | -- | -- |
| Fruit | enum | FruitStore가 저장하는 Element이자 Juice의 재료인 과일 목록 |
| Storing| protocol | Element를 저장할 수 있는 Storing 청사진
| FruitStore | final class | Fruit 창고 객체-클래스 |
| Juice | enum | Fruit가 재료인 주스 목록 |
| JuiceMaker | struct | Juice를 만드는 객체-구조체 |
| JMError | enum | JuiceMaker 관련 Error 목록 |

> **FruitStore는 다음의 조건을 충족해야합니다**ㅤ

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
>
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

> **과일의 재고가 부족하면 과일쥬스를 제조할 수 없습니다** \
> **JuiceMaker는 FruitStore를 소유하고 있습니다**

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

### 1️⃣ FruitStore

- 과일 재고 관리
  - 과일과 과일수량의 값을 매칭하여 관리하기 위해 Dictionary를 사용하였습니다.
  - `Key: 과일` `Value: 수량`
- 과일수량 초기값 설정
  - 과일별로 초기값을 지정하기 위해 `CaseIterable`프로토콜의 `allCases`를 활용하여 설정하였습니다.
- add 함수 관련  

    ```swift
    final class FruitStore: Storing {

        func add_before(item: Fruit, count: Int) {
              guard let stock = items[item] else {
                  // some Error
              }
              items[item] = stock + count
        }

        func add_after(item: Fruit, count: Int) {
              items[item, default: 0] += count
        }
    }
    ```

  - 초기에는 Dictionary의 subscript의 반환값이 `optional`로 반환되어 `guard let` 바인딩을 통해 해결했습니다.
  - 하지만, guard let 바인딩으로 처리하면 else 구문을 처리하여야 하는데 앞선 input값을 hasEnough함수를 통해 정제하므로 실행될 일이 없다고 판단하였습니다.
  - 이에 더불어 기존에 없는 key라고 하더라도 그것이 Storing의 Element이기만 하다면, (FruitStore의 경우 Fruit) 새롭게 추가하면 된다고 생각했어요.
  - 따라서 subsript의 `default`를 활용해 기존 구현을 수정했습니다.

- subtract 함수 관련

    ```swift
    final class FruitStore: Storing {
      
        func subtract_before(item: Fruit, count: Int) {
              guard let stock = items[item] else {
                  // some Error
              }
              items[item] = stock - count
        }

        func subtract_after(item: Fruit, count: Int) {
              items[item]? -= count
        }
    }
    ```
  - add와 동일하게 초기에는 Dictionary의 subscript의 반환값이 `optional`로 반환되어 초기에는 `guard let` 바인딩을 통해 해결했습니다.
  - 그러나 FruitStore에 의존하는 JuiceMaker는 Juice를 만들 때 만들기 전에(subtract 함수를 호출하기 전에) `hasEnough` 함수를 통해 미리 재고를 확인합니다.
  - 그러므로 nil이 나올 가능성이 없다고 판단, FruitStore의 subtract는 위와 같이 구현을 변경했습니다.
    - nil이면 아무런 동작을 하지 않고, nil이 아니면 뺀 값으로 업데이트합니다.
  - 그런데 Storing 프로토콜만 떼어 놓고 생각한다면, hasEnough method가 먼저 불린다는 보장이 없어서 갖고 있지 않은 Element 혹은 재고보다 많은 수를 빼달라는 요청이 들어올 수 있습니다.
  - ❓ 이를 고려한다면 subtract method가 이러한 상황에 대비해야 해야 하는게 아닐까 싶기도 한데, 소대의 의견은 어떤가요?
  
### 2️⃣ Storing

- Storing을 프로토콜로 정의한 이유는 2가지 입니다.
   1. Storing 프로토콜을 인터페이스로 활용하여 `JuiceMaker`의 `FruitStore`에 대한 의존성을 해결한다.
   2. 향후 `Store`의 확장성을 높인다. -> 확장성을 위해 `Generic`을 활용했습니다.

- Naming
  - Store 프로토콜 명칭을 고민하던 중 [이 글](https://santoshbotre01.medium.com/naming-a-protocol-in-swift-b0d933b44ddc)을 참고하여
  - > Performed by = name+ing\
    > Performed on = name+able \
    > Performed for = name+delegate\
    > Unable to identify = name + protocol
  - 저장소의 프로토콜 명칭은 `Storing`을 사용하였고, 저장소에 저장되는 요소는 Hashable & CaseIterable을 채택한 `Storeable`을 제너릭 타입명칭으로 활용하였습니다
  - ❓ 적절한 네이밍이었을까요?
  - ❓ 소대의 좋은 네이밍 비결은 무엇인가요?

### 🤔 의존성 주입

- 해당 과제의 모델링을 논의하면서 `Singleton`, `상위객체(JuiceMaker)-하위객체(FruitStore)`, `의존관계역전원칙을 적용한 의존성 주입` 등 다양한 방법을 시도했어요
- 함께 스터디를 진행한 결과 의존성 주입을 활용하면 확장성을 추가로 가져갈 수 있다고 판단하여 이와 같이 구성했습니다
- 친숙하지 않은 Protocol과 Generic을 함께 사용해서 그런지 실제 코드에 적용할 때 어려웠는데요
  1. 처음에는 단순히 외부에서 fruitStore 객체를 만들어 주입해주면 의존성 주입이라고 생각했어요
  2. 그런데 함께 공부하다보니 JuiceMaker의 프로퍼티인 fruitStore가 FruitStore 타입이 아니라 Storing 타입이어야 성공적으로 DIP를 적용한 것이라고 생각했습니다
  3. 그래서 Storing을 JuiceMaker에 넣은 결과.. 수 많은 컴파일 에러와 인사하게 되었고
  4. 구글신과 애플 문서, 스택 오버플로우를 돌고 돌아 지금의 코드가 완성되었어요
- Fruit를 저장하는 Storing 타입만 fruitStore가 될 수 있도록 타입 제약을 걸었다고 이해했습니다.
- 그런데 현재의 코드가 유연성을 해치지는 않는지, 즉 이러한 타입 제약이 프로토콜을 채택한 의미를 퇴색시키는 것이 아닐지 생각했어요.
- ❓ 이에 대한 소대의 의견은 어떤지, 그리고 이를 개선할 방법이 있을지 궁금해요!
