# 쥬스 자판기 [STEP 1] Mango, SwainYun

리뷰어: @zdodev
참가자: 망고, 스웨인

안녕하세요, 소대!
쥬스 자판기 [STEP 1] PR 올립니다.

---------------------

## 프로젝트 구성

* **쥬스와 과일의 종류를 나타내는 열거형**

```swift
@frozen enum JuiceType {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaMixJuice, mangoJuice, mangokiwiJuice
}

@frozen enum FruitType {
    case strawberry, banana, kiwi, pineapple, mango
}
```

* **Fruit 모델**
```swift
struct Fruit {
    let fruitType: FruitType
    let quantity: Int
    
    init(_ fruitType: FruitType, _ quantity: Int) {
        self.fruitType = fruitType
        self.quantity = quantity
    }
    
    func updateQuantity(to quantity: Int) -> Fruit {
        return Fruit(self.fruitType, quantity)
    }
}
```
    * 주스 만드는 데 필요한 과일 종류와 수량을 가져오기 위한 구조체
    1. updateQuantity(): 과일 개수를 새로고침하는 함수
    2. 개수과 종류 정보를 가지고 비교할 수 있도록 함

* **FruitStore 클래스**
```swift
final class FruitStore {
    private var fruits: [Fruit] = [
        Fruit(.strawberry, 10),
        Fruit(.banana, 10),
        Fruit(.kiwi, 10),
        Fruit(.pineapple, 10),
        Fruit(.mango, 10)
    ]
    
    func receiveOrder(juiceType: JuiceType) {
        switch juiceType {
        case .strawberryJuice:
            makeJuice(Fruit(.strawberry, 16))
        case .strawberryBananaMixJuice:
            makeJuice(Fruit(.strawberry, 10),Fruit(.banana, 1))
        case .bananaJuice:
            makeJuice(Fruit(.banana, 2))
        case .kiwiJuice:
            makeJuice(Fruit(.kiwi, 3))
        case .pineappleJuice:
            makeJuice(Fruit(.pineapple, 2))
        case .mangoJuice:
            makeJuice(Fruit(.mango, 3))
        case .mangokiwiJuice:
            makeJuice(Fruit(.mango, 2), Fruit(.kiwi, 1))
        }
    }
}
```

    * FruitStore class
    1. 과일 초기 수량 설정, 주문 시 필요한 과일 레시피로 주문 받는 함수
    
* **makeJuice() 메서드**
```swift
private func makeJuice(_ ingredient: Fruit) {
    guard validateQuantity(ingredient: ingredient) else { return }
    updateFruit(fruit: ingredient)
}

private func makeJuice(_ firstIngredient: Fruit, _ secondIngredient: Fruit) {
    guard validateQuantity(ingredient: firstIngredient), validateQuantity(ingredient: secondIngredient) else { return }
    updateFruit(fruit: firstIngredient)
    updateFruit(fruit: secondIngredient)
}
```

    * makeJuice()
    1. 과일 수량 조절 함수
    2. receiveOrder()를 통해 전달받은 레시피에 따라서 현재 재고와 요구된 재고를 비교, 유효할 경우에 재고를 수정, 반영하기 위한 전처리 단계
> 1. 원래 `makeJuice(_ firstIngredient: Fruit, _ secondIngredient: Fruit?) { }` 형태의 메서드 하나만 사용하려 했으나, 옵셔널인 두번째 재료에 대해 `guard ~ else`로 early exit하는 과정 중 무조건 탈락되게 되어 두 조건 동시에 비교할 수 없어서 위와 같은 형태로 다시 작성했습니다.
> 2. 현재 코드로는, 만약 요구되는 재료가 세 가지, 네 가지 필요한 음료가 등장한다면 `makeJuice()`를 그만큼 추가로 작성해주어야 하는 것이 걱정됩니다. 새로운 요구에도 대응할 수 있는(재사용 가능한) 메서드를 어떻게 만들 수 있을지 궁금합니다.

* **유효성 검사, 재고 변경**
```swift
private func validateQuantity(ingredient: Fruit) -> Bool {
    guard let fruit = fruits.filter({$0.fruitType == ingredient.fruitType}).first else { return false }
    return fruit.quantity - ingredient.quantity >= 0
}

private func updateFruit(fruit: Fruit) {
    guard let index = fruits.firstIndex(where: {$0.fruitType == fruit.fruitType}) else { return }
    let target = fruits[index]
    let newQuantity = target.quantity - fruit.quantity
    fruits[index] = target.updateQuantity(to: newQuantity)
}
```

    * 유효성 검사, 재고 변경
    1. validateQuantity(): 현재 재고로 음료를 만들 수 있는지 확인하는 메서드
    2. updateFruit(): 현재 재고에서 음료를 만들고 남은 재고로 새로고침하는 메서드
> 1. 아쉬운 부분: `makeJuice()` 메서드에서 필요한 경우마다 1~2번 씩 호출하고 있는데, 더 효율적이고 알아보기 쉬운 메서드로 만들고자 했지만 방법을 찾지 못했습니다.
