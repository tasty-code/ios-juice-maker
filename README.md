# 쥬스 메이커 🧃
## 기능 구현
- 쥬스 주문
<img width="600" alt="스크린샷 2023-01-09 오후 9 07 14" src="https://user-images.githubusercontent.com/79438622/212268167-8d9895c6-7abb-42e6-9519-a6e97d89c962.png">

- 쥬스 주문 실패
<img width="600" alt="스크린샷 2023-01-09 오후 9 08 50" src="https://user-images.githubusercontent.com/79438622/212268305-6b8d9123-d992-48c7-ab89-cc0259a9a036.png">

- 재고 부족 Alert
<img width="380" alt="스크린샷 2023-01-09 오후 9 13 06" src="https://user-images.githubusercontent.com/79438622/212268965-2a5015f7-9182-4ef9-8354-335a82b9b853.png">

- 재고 수정
<img width="600" alt="스크린샷 2023-01-09 오후 9 15 58" src="https://user-images.githubusercontent.com/79438622/212268892-426d0e68-1b72-4744-b9a9-6b70843b53d9.png">

- 닫기 버튼
<img width="380" alt="스크린샷 2023-01-09 오후 9 17 41" src="https://user-images.githubusercontent.com/79438622/212268914-276918dd-aa95-43e6-b2dd-a858742bfe30.png">

## 시퀀스 다이어그램
<img width="738" alt="Untitled" src="https://user-images.githubusercontent.com/79438622/212269325-b6508f17-9e6b-442d-850c-fdc583279087.png">

## 구현 화면
<img width="738" alt="Untitled" src="https://user-images.githubusercontent.com/79438622/212269375-513c10de-f66a-472c-bca0-bd6cdc70ad60.gif">
<img width="738" alt="Untitled" src="https://user-images.githubusercontent.com/79438622/212269397-c4ba9254-8e43-48dc-ba48-3d0f606b4a63.gif">

## **Custom class**
```swift
class FruitLabel: UILabel {
    var fruit: Fruits?

    func setting() {
        guard let fruit = self.fruit else {
            return
        }
        text = FruitStore.shared.stock(fruit: fruit)?.description
    }
}
```
- storyboard에서 사용할 수 있도록 UILabel, UIStepper, UIButton 하위 클래스를 생성했어요.
- FruitLabel의 text 값을 FruitStore에서 받아온 각 과일의 재고로 변경했어요.
- UIStepper에서도 동일하게 FruitStore의 값으로 초기화를 한 뒤 사용할 수 있도록 변경하였어요.
- UIButton의 경우에는 protocol을 이용하여 속성 값을 추가했어요.
- Object 별로 생성한 다음 custom class를 storyboard에서 매칭을 시켜줬어요

## 고민했던 부분
### 데이터 전달
ViewController에서 모델의 데이터를 사용하기 위해서 데이터 전달하는 방법을 알아보았고 그 중에서도 Delegate를 이용한 데이터 전달로 해결을 했어요
```swift
// JuiceMakerViewController.swift
class JuiceMakerViewController: UIViewController {
    override func viewDidLoad() {
        FruitStore.shared.updateDelegate = self
    }
}

extension JuiceMakerViewController: UpdateDelegate {
    func updateLabel(fruit: Fruits) {
        // ...
    }
}

protocol UpdateDelegate: AnyObject {
    func updateLabel(fruit: Fruits)
}

// FruitStore.swift
final class FruitStore {
    weak var updateDelegate: UpdateDelegate?
    
     func update(fruit: Fruits, quantity: Quantity) {
        // ...
        updateDelegate?.updateLabel(fruit: fruit)
    }
}
```

### dictionary 값 변경
Dictionary에서 값을 변경할 때, 우선적으로 key값이 있는지 확인하면서 Optional을 Unwrapping해야 하는데 `!` 를 사용하지 않는 방법에 대해서 고민했습니다
updateValue(_:forKey:) 공식문서를 보면 @discardableResult 키워드로 반환값을 사용하지 않아도 된다고 판단, guard문을 통해서 key값을 확인해서 새로운 값이 추가되지 않도록 하었습니다
```swift
func manageFruit(_ fruit: FruitsKind, quantity: Int) {
    guard let stock = self.fruits[fruit] else {
        return
    }
    self.fruits.updateValue(stock - quantity, forKey: fruit)
}
```

### MVC 패턴에서 Error 처리
MVC 디자인 패턴을 사용할 때, Error의 핸들링(do-catch문)을 어떻게 처리를 해야 하나 고민을 했어요. Model에서 Error를 반환하였다면, Controller에서 확인하고 에러의 상황을 Alert으로 통해서 View에서 보이게 만들었어요.
```swift
// ViewController.swift
@IBAction func orderJuice(_ sender: UIButton) {
    guard let juice = (sender as? MenuObject)?.juice else {
        return
    }
    do {
        try juiceMaker.make(juice: juice)
        madeJuiceAlert(juice: juice)
    } catch {
        shortOfStockAlert(message: error.localizedDescription)
    }
}
```
