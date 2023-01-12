# ios-juice-maker
----

<a href ="#1-Step1---쥬스 메이커 타입 정의">Step1 - 쥬스 메이커 타입 정의</a>
<a href ="#2-Step2---초기화면 기능구현">Step2 - 초기화면 기능구현</a>
<a href ="#3-Step3---재고 수정 기능구현">Step3 - 재고 수정 기능구현</a>

----
## 🗂️ 프로젝트 파일 구조
<img src = "https://user-images.githubusercontent.com/45708630/210944976-ffe0afcd-d73e-478b-ad73-efb36373d22a.png" width=1000 height=400>

---
## 🔖 역할 분배
|enum|역할|
|:---|:---|
|`FruitList`|과일 리스트를 Case별로 나누었습니다.|
|`FruitSingleJuice`|한 가지 종류의 과일 쥬스를 만들 수 있는 Case별로 나누었습니다.|
|`FruitMixJuice`|두 가지 종류의 과일 쥬스를 만들 수 있는 Case별로 나누었습니다.|
|`StockError`|재고가 없을 때 에러메세지를 출력할 수 있도록 Case별로 나누었습니다.|

|protocol|역할|
|:---|:---|
|Makeable|`JuiceMacker`가 제조하는 역할만 할 수 있도록 메서드를 정의하였습니다.|
|Computable|`Calculator`가 계산기처럼 사칙연산의 역할만 할 수 있도록 메서드를 정의하였습니다.|

|struct & Class|역할|
|:---|:---|
|`JuiceMaker`|제일 상위 모듈로 ViewController에서 요청하는 행위를 진행할 수 있도록</br> 구현하였습니다.|
|`FruitStore`|Singleton 패턴을 적용하여 재고관리를 진행하는 클래스 타입의 모델입니다.|
|`Calculator`|SOLID의 DIP에 맞추어 계산기 역할을 할 수 있도록 구현된 클래스 타입의 모델입니다.|

---

## Step1 - 쥬스 메이커 타입 정의
[PR #26 | Step1 - 쥬스 메이커 타입 정의](https://github.com/tasty-code/ios-juice-maker/pull/26)

- Singleton Desing Pattern을 사용하여 과일의 재고를 관리하는 FruitStore 타입 정의
- ViewController의 request를 받아 주문서에 맞는 음료 제조를 역할을 하는 JuiceMaker 타입 정의

### 여기부터는 프로젝트 요구사항에 맞춰 문장으로 사용
관리하는 과일의 종류로는 딸기, 바나나, 파인애플, 키위, 망고 총 5가지를 가지고 있으며 각 과일 종류마다
할당되는 초기 재고수량은 10개로 정의한다.
FruitStore 객체는 전체 재고 수량을 조절해야하기 때문에 ViewController에서 `재고 수정` 버튼으로
요청이 들어올 때 수량을 n개 변경하는 기능을 구현하였다.

JuiceMaker는 FruitStore를 소유하고 있어 공유자원을 통해 음료를 제조할 수 있으며
`startMake(single:)`과 `startMake(mix:)`를 통해 어떤 음료를 주문받는지 분기할 수 있으며
`requestTo(single:)`과 `requestTo(mix:)`를 통해 주문 받은 과일의 종류를 알려주면 하나의 메서드 안에서 제조할 수 있도록 하였습니다.
reqeust 메서드 안에는 주문 받았을 때 과일의 재고가 부족하면 기존 재고를 유지하고 제조할 수 없다는
메세지를 출력합니다.
    
### 🚀 적용해보려고 노력해본 점

#### 1. 프로토콜 채택
- Model/Protocol 내 채택할 프로토콜 파일 생성
- Makeable.swift, Computable.swift
```Swift
protocol Makeable {}
protocol Computable {}
```
JuiceMaker, Calculator에서 모든 코드를 작성/수정하는 것이 아니라 프로토콜을 사용함으로써 기능의 변동사항이 발생 시 반영을 쉽게 했습니다.
실제 Calculator는 처음에 add, subtract만 기능하였는데 compare 메서드가 필요했을 때 채택했던
Computable에 추가하여 바로 반영이 가능했습니다.
또한 이렇게 프로토콜을 채택하면서 각각이 필요한 기능만 하도록 제약하여 역할의 분리를 꾀할 수 있었습니다.

#### 2. 중복되는 코드 메서드화

JuiceMaker의 requestTo 메서드는 처음에 각 Single Fruit Juice, 각 Mix Fruit Juice에 있었습니다.
그러나 과일 유형만 다르고 코드가 동일했기 때문에 forEach를 사용하여 하나의 메서드로 통합할 수 있었습니다.

---
## Step2 - 초기화면 기능구현
(예시 위와 동일)

---
## Step3 - 재고 수정 기능구현
(예시 위와 동일)

---

### Step1 실행화면
<img src="https://user-images.githubusercontent.com/92699723/210941422-16c25bf6-6bdb-4239-ae0b-39853c1697ea.png" width=500>
