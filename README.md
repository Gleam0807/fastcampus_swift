# fastcampus_swift
- 네카라쿠배 5개 앱으로 완성하는 iOS 앱 개발 초격차 패키지 학습하기
> 2개의 앱만 중점적으로 공부하는 이유: N사의 voiceMemo는 SwiftUI와 Date타입에 대해 공부할 수 있으며, C사의 commerce는 CodeBase로 화면을 구성할 수 있고, xcodecloud를 사용해볼 수 있어 중점적으로 공부하였습니다.

## 1. N사 음성메모앱 만들기 ( voiceMemo )
#### 학습 목표
>
> 음성메모/ To-do List/ 메모장/ 타이머 기능을 한 앱에 담아 서비스 수준의 앱을 개발합니다

#### 학습 내용
> 
> * SwiftUI
> * MVVM
> * AVFoundation
> * Local Notification
> * SwiftUI의 Custom ViewModifier/Animation
 
#### 구현 기능
> 
> * 음성메모, 알람, Todo 리스트, 메모장 기능
> * 온보딩화면 토글 구현 및 To do list 완료 목록 삭제
> * 음성메모 녹음 플레이어 뷰에 애니메이션 추가
> * 타이머 시간 세팅 커스텀(시/분/초)

> * ## 2. C사 커머스앱 만들기 ( commerce )
#### 학습 목표
>
> 다양한 방식의 UI 구현 및 CI/CD 자동화, 웹뷰 연동을 통한 결제화면 구현까지 완성도 높은 커머스앱을 개발합니다.

#### 학습 내용
> 
> * 코드로 화면을 구성하는 방법 및 UIKit+SwiftUI 혼용해서 사용하는 방법
> * MVVM
> * 동적으로 화면을 구성하는 방법
> * CI/CD 구축 (fastlane / xcodecloud )

#### 구현 기능
> 
> * 상세페이지(상품더보기, 옵션선택 등)
> * 상품화면을 다양한 뷰로 구현하기(스플래기, 배너, 가로스크롤, 세로스크롤)
> * 화면(View)가 누적되는 경우 메모리 관리법
> * 결제화면에서 WKwebview 연동하여 결제
