# 쥬스 자판기 [STEP 3] Mango, SwainYun

리뷰어: @zdodev
참가자: 망고, 스웨인

안녕하세요, 소대!
쥬스 자판기 [STEP 3] PR 올립니다.

------------------------------------

## 프로젝트 구성

### Custom Components & Protocols

* **Stepper, Button, Label 식별을 위한 커스텀 클래스**
```swift
import UIKit

class StrawberryStepper: UIStepper, FruitStockIdentifiable {
    var fruitType: FruitName = .strawberry
}

protocol FruitStockIdentifiable {
    var fruitType: FruitName { get }
}

// 생략...
```

    * Custom class
    1. 각 UI클래스 상속
    2. 적절한 프로토콜 채택
> tag, accessabilityIdentifier를 사용하지 않고 각 컴포넌트를 식별할 방법을 찾다가 도달한 결론입니다. 프로토콜 요구사항인 fruitType을 기준으로 과일을 식별, 각 요소가 ID를 가지게 합니다.

### Typealias

* **별칭**
```swift
import Foundation

typealias FruitName = FruitStore.FruitType

typealias JuiceName = FruitStore.JuiceType
```

    * Typealias
    1. FruitStore 내 Nested Type에 접근
> 타입 명시하다가 오타도 많이 나고 불편했던 점을 typealias 활용해 해결했습니다.

### 그 외 변경사항

* **final, private 키워드**
```swift
final class JuiceMakerViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private var fruitStockLabels: [UILabel]!
    
    // 생략...
    
    @IBAction private func touchNavButton(_ sender: UIBarButtonItem) {
        pushAdjustStockViewController()
    }
}
```

    * final, private 키워드 사용
    1. ViewController에 final 키워드 사용
    2. IBOutlet, IBAction에 private 키워드 사용
> 1. 뷰 컨트롤러 클래스에 final 키워드를 붙혀줌으로써 static dispatch로 인한 성능 향상을 기대할 수 있습니다.
> 2. 현재 IBOutlet, IBAction은 해당 뷰 컨트롤러에서만 사용하는 요소들이므로, private 접근 제어자를 사용하여 보다 나은 캡슐화, 은닉화를 추구하였습니


* **뷰 요소 세팅 과정 변경**
```swift
private func syncStockLabels() {
    for fruitStockLabel in fruitStockLabels {
        guard let label = fruitStockLabel as? FruitStockIdentifiable,
              let stock = inventory?[label.fruitType]
        else { return }

        fruitStockLabel.text = String(stock)
    }
}
```

    * syncStockLabels() 메서드
    1. Label, Stepper, Button에 각 과일을 식별하여 값을 넣음
> 하나의 요소마다 각각 값 초기화 작업을 수행했던 것을 순회하면서 이루어지도록 바꿀 수 있었습니다.
    
### Storyboard

* **iPhone 12 외에 다른 시뮬레이터에서도 UI가 정상적으로 보일 수 있도록 오토레이아웃 적용**
<p>
    <img src="https://hackmd.io/_uploads/SJPUJuq1T.png"raw=true" alt=storyboard" width="400">
</p>

<!-- ![](https://hackmd.io/_uploads/SJPUJuq1T.png) -->

>과일 + 현재수량 + 수량조절버튼을 한 스택에 넣고 spacing을 모두 10으로 통일 했습니다. 그리고 과일stack들을 모두 묶어서 stackView에 넣고 x,y 기준으로 가운데 정렬 Constraints을 걸어주었습니다.
