# 쥬스 메이커 앱

사용자가 주문 화면을 통해 과일 쥬스를 만들어 내는 앱 입니다.

## 팀원

| <img src="https://github.com/Gnoam-R/ARAD_Public/assets/67363759/44a01b47-c80b-49ca-b30b-19a9061a52a0" width=120> | <img src="https://avatars.githubusercontent.com/u/67363759?v=4" width=120> |
| --- | --- |
| 폴<br/>https://github.com/earths-voluble | 노움<br/>https://github.com/rohhyungwoo |

## STEP1

- 쥬스 주문 로직 구현
    - Dictionary 입력된 쥬스 네이밍을 판단하여 필요한 과일의 수량을 반환한다.
    - 문자열 파싱으로 쥬스에 연관된 과일 정보를 구분, 과일 객체의 속성에 접근한다.
- ErrorHandling
    - 정상적인 입력인가, 과일 수량은 충분한가에 대한 에러 처리를 진행

## STEP2

- View와 Model 연결
    - View의 버튼과 주문 로직을 연결
    - 과일 수량 View와 과일 저장소를 연결
- 화면 이동
    - Navigation 화면 이동
    - Modal 화면 이동

## STEP3

- 다른 View간의 데이터 연결
    - 싱글톤 패턴을 사용하여 하나의 인스턴스만을 생성
- 화면 구성
    - AutoLayout으로 다양한 디바이스에 대한 화면 구성
    - Custom View 생성
 
## UML
![JuiceMaker](https://github.com/earths-voluble/ios-juice-maker/assets/103843007/80b61952-f281-499d-b020-6248417d27e2)

