# ios-juice-maker🧃
쥬스메이커 프로젝트 저장소입니다. 

## 팀원:busts_in_silhouette:

| 프로필 사진 | <a href="https://github.com/newJunsung"><img src="https://avatars.githubusercontent.com/u/107932188?v=4" width="90" height="90"></a> | <a href="https://github.com/shlim0"><img src="https://avatars.githubusercontent.com/u/46235301?v=4" width="90" height="90"></a> |
| ---- | ----------- | --------- |
| in Github | [@newJunsung](https://github.com/newJunsung) | [@JJong](https://github.com/shlim0) |
| in SeSAC | 뉴준성 | JaeHyeok |

## 폴더 구조:file_folder:
```mermaid
classDiagram
class Controller {
  AppDelegate.swift
  FruitInvetoryViewController.swift
  JuiceMenuViewController.swift
  SceneDelegate.swift
}

class Model {
  FruitStore.swift
  FruitType.swift
  JuiceMaker.swift
  JuiceMakerException.swift
  JuiceType.swift
}

class View {
  Assets.xcassets
  LaunchScreen.stroyboard
  Main.storyboard
}
```

## 흐름도:ocean:
- **쥬스 선택**
```mermaid
sequenceDiagram
actor 손님
손님 ->> View: 쥬스 메뉴 선택
View ->> Controller: 어떤 메뉴 선택했는 지 전달
Controller ->> JuiceMaker: 선택된 쥬스의 재료 전달
loop 쥬스의 재료 과일의 수
  JuiceMaker ->> FruitStore: 과일의 수량 확인
  opt 과일의 수량이 부족하다면
    FruitStore ->> Controller: negativeCountError 던짐.
    Controller ->> View: 수량 부족 알림 전달
  end
end
loop 쥬스의 재료 과일의 수
  Note over FruitStore: 수량의 변화
end
Controller ->> FruitStore: 증가(감소)된 수량 확인
Controller ->> View: 수량 적용, 쥬스 제조 완료 알림 전달
```

- **과일 수량 증감**
```mermaid
sequenceDiagram
actor 사장님
사장님 ->> View: 수량 증가 or 감소 버튼 클릭
View ->> Controller: 과일 수량의 변화
alt 과일 수량이 감소했을 경우
  Controller ->> JuiceMaker: 수량 감소 요청
  JuiceMaker ->> FruitStore: 수량 감소 함수 실행
  opt 과일의 수량이 음수가 될 경우
    Note over FruitStore: 변화 없음
  end
else 과일 수량이 증가했을 경우
  Controller ->> JuiceMaker: 수량 증가 요청
  JuiceMaker ->> FruitStore: 수량 증가 함수 실행
end
Note over FruitStore: 수량의 변화
Controller ->> FruitStore: 증가(감소)된 수량 확인
Controller ->> View: 수량 적용
```
