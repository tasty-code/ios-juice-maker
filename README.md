# ios-juice-maker

## 프로젝트 참여자
|<a href="https://github.com/KSK9820">Dora</a>|<a href="https://github.com/JEON-Sungsu">Howard</a>|
|----|----|
|<image src="https://github.com/KSK9820/ios-juice-maker/assets/63297236/dbf7a327-774a-49de-94a3-925c57a8e1eb" width="100" height="100"/>|<image src="https://github.com/KSK9820/ios-juice-maker/assets/63297236/fbc57a30-2fe9-4ac8-8368-47cec6db6c72" width="100" height="100">|
<br/>

## 프로젝트 간단 소개&설명
- 결과 화면 <br/>
<div >
    <image src="https://github.com/KSK9820/ios-juice-maker/assets/68066104/97dace04-785d-435f-a9c0-4695ce711065" width="800" height="auto">
</div>
  
- 사용자의 입력을 받아, 과일음료를 만들어 주는 앱
    - Model
        - JuiceMaker : 사용자의 요청을 받아 음료를 제작해주고 제작 결과에 대해서 알려준다. FruitStore에 음료를 만들기 위한 과일이 존재하는지 확인하고 소모된 과일의 수를 알려준다.
        - FruitStore : class 타입이며, 과일의 재고량을 관리하며 요청에따라 과일 재고를 추가하거나 삭제한다.
        - ErrorMessage: enum 타입의 Error, CustomDebugStringConvertible 를 채택하여 오류 발생시 에러 메세지를 주도록 만듦
        - Fruit : enum 타입으로 과일이름을 열거형으로 만듦
        - Juice: enum 타입으로 CustomStringConvertible를 채택하였고, 주문받을 과일 음료의 이름들을 열거형으로 만들고, 음료가 제작되었을 때, 어떤 음료가 제작되었는지 String을 반환하도록 만들고, 과일 쥬스의 이름으로, 어떤 과일이 몇개가 필요한지를 리턴해주는 레시피를 만듦.
    - ViewController
        - ViewController : 음료 주문 View를 관리하고, 현재 음료를 만들기 위한 과일의 재고량을 View에 보여준다.
        - StockViewController : 과일의 재고량 관리 View. stepper를 통해 과일을 추가하거나 삭제 요청을 한다.

- 주요 함수 관계 <br/>
  ![image](https://github.com/KSK9820/ios-juice-maker/assets/63297236/47dabec8-749a-456a-9b5b-eb92fda2a61e)
- 시퀀스 다이어그램 <br/>
  ![쥬스자판기_sequence drawio](https://github.com/KSK9820/ios-juice-maker/assets/68066104/05dc0856-3572-4da9-8920-c5addb386cf5)
- 클래스 다이어그램 <br/>
  ![쥬스매이커_클래스 drawio](https://github.com/KSK9820/ios-juice-maker/assets/68066104/d6c1966a-91af-435e-b369-19dbfbd07150)
<br/>

## 프로젝트를 진행하며 중점적으로 학습하고 적용시킨것

- 추상화 & 은닉화
    - 데이터를 관리하는 class를 은닉화 하기 위해서 singleton 패턴을 사용하려고 했으나, singleton은 은닉화와는 관계가 없다는것을 배우게 되었다.
    - private, public, internal, private (set), FIle private 등 접근제어자들에 대해 배우고 적용할 수 있도록 노력하였다.
- VC 화면 전환간 데이터 주고받기
    - VC간 데이터를 주고 받는 방법에는 다양한 방법이 있다.
        - 데이터 직접 주입방식 (프로퍼티 직접 접근)
        - delegate 패턴 방식
        - segue
        - closure
    - 우리가 진행한 사용해본 방법
        - 데이터 직접 주입
            - 최초에는 AViewController 에서 BViewController의 프로퍼티에 직접 접근하여 모델을 넣어주는 방식으로 했으나, 은닉화를 위해서 함수를 통해 모델을 주입해주는 방식으로 변경하였다. 모델을 직접 주입 `stockVc.injectModel = self.juiceMaker` 로 사용하게 되면 외부에서 stockVC의 프로퍼티에 직접 접근하여 은닉화를 침해할 수 있기 때문에 함수를 통하여 넘겨주게 되었다.
            
            ```swift
            private func moveToStockVc() {
                    guard let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as? StockViewController else {
                        return
                    }
                    stockVC.injectModel(self.juiceMaker)
                    stockVC.delegate = self
                    self.navigationController?.pushViewController(stockVC, animated: true)
                }
            ```
            
        - delegate
            - BVC에서 AVC로 돌아가는 과정에서는 delegate 패턴을 통해서 업데이트된 모델을 다시 넘겨주어 AVC에서 View를 업데이트 해주도록 만들어 주었다.
- Autolayout
    - 기본적인 Autolayout 사용법을 익히고 적용하였다.
    - UIKit 별로 constraint를 적용시키는 법, 기준을 잡는법등 을 배울 수 있었다.
<br/>

## 가장 큰 고민이었던 부분 @Howard

- 은닉화에 관한 부분
    - private를 통해서 외부에서 접근을 차단하고, 대신 접근할 수 있는 메서드를 제공함으로써 데이터에 접근을 시키게 해야 된다.
    - JuiceMaker 모델은 FruitStore를 소유하고 있고, FruitStore의 데이터에 접근하기 위해 특정 함수를 통해서 접근할 수 있다.
    - AViewController에서 생성된 JuiceMaker 객체는, FruitStore에 접근하기 위해, FruitStore의 데이터에 접근하는 메서드를 호출하는 또다른 메서드를 JuiceMaker모델에서 만들어서 넘겨줘야 하는 상황이 생기고, 그러면 JuiceMaker는 FruitStore의 함수를 전달해주는 역할밖에 못하게 되었다.
    - 이를 해결하기 위해서 protocol 을 사용해보려고 시도했으나, 명확하게 이해하고 사용하기에는 시간적으로 부족하여, 일단 해결하지 못한채 그대로 사용하게 되었다.
- 의존성 주입(DI) 와 관련된 부분
    - AViewController 에서 BViewController로 데이터를 넘기는 과정에서, 은닉화, 의존성이 생기는 부분에 대해서 지적을 받았고, 이를 해결하기 위해 의존성 주입(DI)를 익히고 적용시킬것을 권유받음
    - 의존성 주입과 관련해 학습하고 적용시킨 형태가 VC간 데이터 이동에 메서드를 통해 모델을 주입하는 방향으로 작성함.
    - 실제로는 protocol을 통해서 모델에서부터 설계를 다시하는게 옳은 방법이겠으나 시간적 여유도 없었거니와 명확하게 이해못한것을 사용하는것은 아니라는 생각에 추후에 개선해보도록 방향을 잡음.
- 모델(class FruitStore)의 프로퍼티 타입을 무엇으로 할것인가
    - 과일별로 프로퍼티를 만들고, 프로퍼티의 값을 구조체를 넣어서 사용하면 어떨까?
        - 그렇게 되면 FruitStore가 구조체에 너무 의존하게 되어버림
        - 메서드를 통해 특정 과일을 찾기 위해서 늘 switch 문을 사용해야 하므로 가독성이 떨어짐
    - FruitStore의 프로퍼티를 Dictionary로 변경하여 바로 초기화 시켜버림
        - 메서드를 통해 과일을 찾기 위해서 늘 에러 핸들링을 해주어야 하는 상황 발생
        - 이곳 저곳에서 Do-try-catch를 써야되는 상황 발생
    - Protocol을 이용하려고 했으나 이또한 지식이 부족하여 적용을 실패함
- 결론
    - Protocol에 대한 학습을 통해 다음 프로젝트에서는 위의 문제들을 해결할 수 있도록 만들어야 겠다.
<br/>

## 개발 과정과 고민 @Dora

→는 고민 갈래, ⇒ 는 실제 개발 방향

- FruitStore의 private 변수를 JuiceMaker에서 어떻게 접근할 수 있을까?
    - 모든 곳에서 접근할 수 있지만, 동일한 프로퍼티를 복사할 수 없어서 값을 관리하기 쉬운 `Singleton`을 사용하는 것은 어떨까? → NO `Singleton` 은 은닉화가 아니다.
        - 은닉화는 외부 객체에서 접근할 수 없게해서 상태값을 볼 수 없게 해야한다.
    - ⇒ 외부에서 접근할 수 있는 함수(public)를 통해 private 변수의 값을 전달하게 하자.
    - → `private (set) 변수명`을 사용하면 외부에서 데이터를 읽을 수는 있다! read-only
        - 그렇다면 외부에 데이터를 제공하는 함수를 만들 필요가 있나?
        - ⇒ `private (set)`으로 만든다면 어딘가에서 의존성이 생겨서 디미터법칙을 위반할 수 있게 된다. (디미터 법칙: 객체의 내부 구조가 외부로 유출)
- ViewController간에는 데이터를 어떻게 주고 받을까?
    - → View에서 Stock으로 보낼 때 데이터를 delegate로 보내면 추후 프로젝트가 복잡해져도 안전하지 않을까?
    - ⇒ (데이터 직접 주입 참고) 인스턴스를 직접 넘겨서 원본을 업데이트 시키는 방법 대신 
    모델을 주입해서 사용하고 업데이트된 모델을 돌려 받아 뷰에 업데이트하는 방법을 사용
    - ViewController 에서 StockController로 데이터를 보낼 때는 모델을 주입하는 방법을 사용하고
    - StockController에서 ViewController로 데이터를 보낼 때는 delegate를 사용하였다.
- MVC 이론의 실습
    - Model-View-Controller
        - Model은 데이터를 저장하고, 데이터에 수정이 있다면 → Controller에게 알려 view를 업데이트 시킨다.
        - 사용자가 View를 조작하면 Controller가 이 변화를 해석하고 → Model에게 알려서 업데이트한다.
    - 뷰에서는 데이터를 저장하면 안된다. Model에서 로직을 처리하고 View는 정말 표시만 해줘야 한다.
        - ⇒ Model의 데이터를 View로 가져와서 연산하지 말고, Model에 있는 함수를 사용만 해야한다. 그렇기 때문에 인스턴스 모델을 주입받아 사용해야한다.
