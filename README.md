# Project 02. 쥬스자판기

## 목차
> [1. Overview](#Overview)
>
> [2. Key Topics](#Key-Topics)
>
> [3. 프로그램 화면 예시](#프로그램-화면-예시)
>
> [4. 프로그램 설명](#프로그램-설명)
>
> [5. 이번 프로젝트를 통해 배운 것](#이번-프로젝트를-통해-배운-것)
>
> [6. 회고](#회고)

## Overview

MVC 패턴을 적용한 실습용 프로젝트입니다.
storyboard 를 활용하여 화면을 구성하고, 이를 실제 코드와 연동하는 과정을 학습했습니다.

## Key Topics
- 타입의 캡슐화/은닉화
- 내비게이션 바 및 버튼 아이템의 활용
- 얼럿 컨트롤러 활용
- Modality의 활용
- 화면 사이의 데이터 공유
- 오토레이아웃 적용해보기
- Protocol / Extension 활용
- MVC 패턴의 이해

## 프로그램 화면 예시

### 쥬스 주문 화면
![스크린샷 2023-12-22 오후 1 42 55](https://github.com/eensungkim/ios-juice-maker/assets/73898006/7fe50e0a-98d3-4879-9a91-e87398793809)

### 쥬스 주문 성공 시
![스크린샷 2023-12-22 오후 1 43 00](https://github.com/eensungkim/ios-juice-maker/assets/73898006/19b86d4d-4427-41ef-9ca6-6db8304f8e21)

### 재고 부족 시
![스크린샷 2023-12-22 오후 1 43 06](https://github.com/eensungkim/ios-juice-maker/assets/73898006/24a21a12-110f-41ca-9cec-bf4deabf18ad)

### 재고 수정 화면
![스크린샷 2023-12-22 오후 1 43 11](https://github.com/eensungkim/ios-juice-maker/assets/73898006/f344e98e-e15a-41a9-afef-133348ab7783)

## 프로그램 설명
### Model
**JuiceMaker.swift**
- **enum Menu** : 과일쥬스의 종류, recipe property는 쥬스 제작에 필요한 과일 수량 명시
- **makeJuice()** : fruitStore 싱글턴 객체에 과일 재고 소비를 요청

**FruitStore.swift**
- **enum Fruit** : 과일의 종류
- **enum StorageError** : 재고부족에러
- **storage** : 과일 재고 딕셔너리
- **updateStock()** : 재고 변경
- **consume()** : 재고 소비 메서드, 재고가 부족한 경우 에러 출력
- **setUpInitialFruitsStock()** : 초기화 시 storage 에 과일 재고 수량을 10만큼 할당

### View
**Main.storyboard**
- **쥬스 주문 화면** : 과일의 현재 재고 및 주문 버튼 출력, 재고수정 버튼을 클릭해 재고수정 화면으로 이동
- **재고 추가 화면** : 과일의 재고 수량을 변경, 닫기 버튼으로 쥬스 주문 화면으로 이동

### Controller
**FruitJuiceOrderViewController.swift**
- **presentStockViewController()** : 재고 추가 화면으로 이동하는 로직, 위임패턴을 활용해 reloadFruitsCount() 기능 위임
- **orderJuice()** : juiceMaker 객체에 makeJuice() 요청, 성공한 경우 쥬스 수령 alert, 재고가 모자란 경우 재고추가 화면 이동 여부 alert
- **reloadFruitsCount()** : 화면의 label 값을 현재 재고 수량으로 연동
- **alertJuiceServed()** : 쥬스 수령 alert
- **alertInsufficientStock()** : 재고 수정 alert, '예' 선택 시 재고 수정 화면으로 이동
- **stockViewWillDisappear()** : delegate 패턴 활용하여 reloadFruitsCount() 위임
- 그 외 과일 재고 Label, 과일쥬스 주문 버튼에 연동된 @IBOutlet, @IBAction

**StockViewController.swift**
- **updateStock()** : 재고 변경 요청 및 화면 반영
- **reloadFruitsCount()** : 재고 수량 화면 반영
- **setInitialStepperValues()** : 스테퍼의 초기값을 재고 수량과 연동
- 그 외 과일 재고 Label, Stepper 와 연동된 @IBOutlet, @IBAction

### Sequence Diagram
**쥬스 주문 화면**
![OrderJuice](https://github.com/eensungkim/ios-juice-maker/assets/73898006/e1227c16-69e8-485d-9188-87687b6318ed)

**재고 수정 화면**
![UpdateStock](https://github.com/eensungkim/ios-juice-maker/assets/73898006/94a207b7-9b61-4216-9ccd-0a32520ff358)

## 이번 프로젝트를 통해 배운 것
**UIViewController의 메서드로 관리되는 view의 생명주기**
- **viewIsAppearing()** : view가 onscreen 에 나타날 때 콘텐츠의 변화를 view에 반영하려면 이 메서드에 적용. 
공식문서는 viewWillAppear() 대신 viewIsAppearing() 활용을 권장
[참고문서 링크](https://developer.apple.com/documentation/uikit/view_controllers/displaying_and_managing_views_with_a_view_controller#3370691)

**Delegate(위임) 패턴**
- 프로토콜을 활용하여 위임 패턴 구현 가능
- 프로토콜을 타입으로 활용하여 전달하기 때문에 프로토콜에서 요구하는 내용만 위임할 수 있음



## 회고
storyboard의 view와  viewController 와 연동하고, auto layout 을 활용해 반응성있는 화면을 구현해볼 수 있었습니다.
또한 이 과정에서 내비게이션과 모달을 활용한 화면 전환 방법, view의 생명주기 등을 새롭게 이해하게 되었습니다.
그리고 프로젝트를 통해 싱글턴, Protocol 과 Delegation 패턴 활용 등을 학습하고 적용해볼 수 있었습니다.
