# 🧃 iOS Juice Maker

>쥬스 자판기 프로그램 구현

## 🙋🏻‍♂️ 팀원

| <img src="https://avatars.githubusercontent.com/u/22284092?v=4" width="150" height="150"> | <img src="https://avatars.githubusercontent.com/u/91656206?v=4" width="150" height="150"> |
| --- | --- |
| Comdori | bello |

## 📱 실행 화면
<img src = "https://raw.githubusercontent.com/comdori-wj/ios-juice-maker/step3/Screenshots/%EC%A5%AC%EC%8A%A4_%EC%9E%90%ED%8C%90%EA%B8%B0_%EC%8B%A4%ED%96%89%ED%99%94%EB%A9%B4.gif">
## 🗂️ 디렉토리 구조

```markdown

├── Controller
│   ├── AppDelegate.swift
│   ├── FruitInventoryViewController.swift
│   ├── JuiceMaker.swift
│   ├── MainViewController.swift
│   └── SceneDelegate.swift
├── Info.plist
├── Model
│   ├── Fruit.swift
│   ├── FruitStore.swift
│   ├── InventoryError.swift
│   ├── JuiceMaker.swift
│   └── JuiceMenu.swift
└── View
    ├── Assets.xcassets
    │   ├── AccentColor.colorset
    │   │   └── Contents.json
    │   ├── AppIcon.appiconset
    │   │   └── Contents.json
    │   └── Contents.json
    └── Base.lproj
        ├── LaunchScreen.storyboard
        └── Main.storyboard
```

### 📝 구현 내용

| 이름 | 타입 | 내용 |
| --- | --- | --- |
| Fruit | enum | 과일의 종류를 정의합니다. |
| JuiceMenu | enum | 제조할 수 있는 쥬스 메뉴에 대해 정의합니다. |
| InventoryError | enum | 과일을 제조할 때 발생할 수 있는 오류에 대해 정의합니다. |
| FruitStore | class | 과일과 수량을 딕셔너리로 가지며, 재고에 대한 수정과 조회에 대한 메서드가 정의되어 있습니다. |
| JuiceMaker | struct | 메뉴를 받아 쥬스를 제조합니다. |
| MainViewController | class | 과일의 수량을 표시하고, 쥬스에 대한 버튼 동작을 수행합니다. 과일이 부족하면 경고 창을 띄워 재고 수정 화면으로 이동할 수 있도록 안내합니다. |
| FruitInventoryViewController | class | 존재하는 과일의 수량을 늘리거나 줄일 수 있습니다. 닫기 버튼을 누르게 되면 이전 화면으로 돌아갑니다. |

## 🤔 고민과 흔적들

### 1. Fruit을 `enum`으로 구현한 이유? 장단점은?

- 함수의 인자로 Fruit 타입을 받고 있는데, 이렇게 구현한 이유는 메서드의 들어올 수 있는 인자의 값을 제한할 수 있다고 생각하였습니다.
- 문자열로 인자를 받는다고 생각하면 오타 등 발생할 수 있는 문제에 대한 처리가 추가로 필요하기 때문에 불편함이 있을 것이라고 생각하였으며,
- 열거형으로써 정의하여 인자를 전달받는다면, 오류에 대한 처리가 보다 간결하지 않을까 라는 생각에 Fruit을 열거형으로 정의 하였습니다.

### 2. `accessibilityIdentifier`

- 각 화면에서 레이블들을 구별해 내기 위해 `accessibilityIdentifier`를 사용하였습니다.
- 공식 문서에서는 “UI 자동화 인터페이스를 사용하여 작성하는 스크립트에서 요소를 고유하게 식별하는 데 사용할 수 있습니다. 식별자를 사용하면 요소의 접근성 레이블을 부적절하게 설정하거나 액세스하는 것을 방지할 수 있습니다.” 라고 설명하고 있습니다.
- 각각 레이블마다 접근하여 `accessibilityIdentifier` 를 이용해 레이블을 식별하고 각 레이블 마다 수량을 보여줄 수 있었습니다.

```swift
strawberryLabel.accessibilityIdentifier = "딸기"
bananaLabel.accessibilityIdentifier = "바나나"
pineappleLabel.accessibilityIdentifier = "파인애플"
kiwiLabel.accessibilityIdentifier = "키위"
mangoLabel.accessibilityIdentifier = "망고"
strawberryJuiceButton.accessibilityIdentifier = "딸기쥬스"
bananaJuiceButton.accessibilityIdentifier = "바나나쥬스"
pineappleJuiceButton.accessibilityIdentifier = "파인애플쥬스"
kiwiJuiceButton.accessibilityIdentifier = "키위쥬스"
mangoJuiceButton.accessibilityIdentifier = "망고쥬스"
strawberryBananaJuiceButton.accessibilityIdentifier = "딸바쥬스"
mangoKiwiJuiceButton.accessibilityIdentifier = "망키쥬스"
```

```swift
private func updateFruitLabels() {
    let fruitLabels = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel]
    fruitLabels.forEach { label in
        guard let label = label, let id = label.accessibilityIdentifier else {
            return
        }
        do {
            guard let fruit = try Fruit(fruitLabel: id) else {
                return
            }
            let count = try juiceMaker.remainingCount(fruit: fruit)
            label.text = "\(count)"
        } catch {
            displayAlert(message: InventoryError.invalidError.description)
        }
    }
}
```

### 3. `private`과 `final`의 사용 목적

- 두 키워드는 반드시 사용할 필요는 없다고 생각했습니다.
    - 그러나 유지 보수성 및 성능 향상을 위하여 사용하는 것이 좋다고 합니다.
- 두 키워드를 사용하면 성능 향상이 되는 이유가 뭔지 알아보았습니다.
    - 스위프트는 기본적으로 `Dynamic Dispatch`를 사용하여 매번 메서드가 호출될 때마다 메서드 테이블에서 해당 메서드를 찾고, 그 메서드를 호출하는 방식을 사용하기 때문에 느리지만, `private` 키워드는 `Static Dispatch`를 사용하여 컴파일 시점에 어떤 메소드가 사용될지 명확하게 결정되어 빠르게 사용할 수 있습니다.
    - `final` 키워드를 클래스에 사용하면 상속이 불가능하고 메서드나 프로퍼티에 붙을 경우네는 하위 클래스에서 오버라이딩 할 수 없기 때문에 `Static Dispatch`로 작동하게 되어 성능 향상이 됩니다.
- 하지만 다음의 경우에는 성능 향상이 되지 않을수 있습니다.
    - 상속을 통해 동작을 변경해야 하는 경우
    - 다른 클래스에서 참조할 필요가 있는 경우
    - 성능을 향상시키기 위해 상속을 허용하고자 하는 경우

> 결론 : 두 키워드를 무조건 사용하기 보다는 성능 향상의 가능성을 고려하여 알맞게 사용 하면 됩니다.
> 

### 4. MVC 패턴을 사용한 디렉토리

- 기존에는 프로젝트 진행시 폴더 분류를 하지 않았지만 이번 프로젝트를 통해 MVC패턴으로 정리 하여 각 구조의 역할이 명확 하므로 각자 맡은 부분을 분담하여 빠르게 구현할 수 있었고, 추후 유지보수시  쉽게  접근 할 수 있을것 같아 앞으로도 mvc패턴을 적용할 것 같습니다.

### 5. `JuiceMaker`와 `FruitStore`에 대한 고찰

- 프로젝트에서는 `FruitStore`를 클래스로, `JuiceMaker`를 구조체로 선언되어 있었습니다.
- 화면 이동을 할 때에, 프로퍼티에 할당하여 값을 넘겨주는 것으로 구현한 이유에 대해서 적어보자면,
- `FruitStore`는 `JuiceMaker`안에서 생성되며, `JuiceMaker`는 `MainViewController`에서만 생성됩니다.
- 생성된 `JuiceMaker`를 넘겨주는 것이기 때문에, `FruitStore`는 새로 인스턴스가 생성되는 것이 아닌 이미 생성된 인스턴스를 가리키는 메모리 주소 값을 가져갑니다.
- 클래스로 선언된 `FruitStore`는 참조 타입이기 때문입니다. 그렇기 때문에 `MainViewController`와 `FruitInventoryViewController`는 서로 다른 `JuiceMaker`의 인스턴스에 동일한 `FruitStore`를 가리키게 됩니다.

## 참고 자료

https://developer.apple.com/documentation/uikit/uiaccessibilityidentification/1623132-accessibilityidentifier