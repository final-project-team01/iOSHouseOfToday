# 오늘의 집 클론 프로젝트
패스트캠퍼스에서 진행하는 팀 프로젝트 <br>
Backend, Frontend, iOS까지 총 10명이 한 팀으로 구성해서 하나의 서비스를 시작부터 끝까지 프론트부터 서버까지 만들어 보는 프로젝트<br>
현재 매우 빠르게 성장중인 스타트업인 버킷플레이스가 서비스하고 있는 인테리어 플랫폼인 `오늘의 집`을 클론한 프로젝트  <br>
* 기간 : 2019.07 ~ 현재
* 소속 : 회식First팀 내 iOS개발 팀
* 역할 : 자체 로그인과 소셜로그인(카카오, 구글, 네이버), 커스텀 UI(CustomCatetoryTabBar), 마이페이지와 사용자 프로필 전반 담당
* 사용기술
  * Swift5
  * SwiftLint, Kingfisher, SnapKit
  * KaKaoSDK, googleSDK, naverSDK
  * Trello, Slack, Github
  * Dynamic AutoLayout

### 설계
* AdobeXD

<a href="/assets/design_adobeXD.gif" target="_blank"><img src="/assets/design_adobeXD.gif"></a>

* Keynote

<a href="/assets/design_keynote.pdf" target="_blank"><img src="/assets/design_keynote.gif" width=600></a>

* 데이터 모델 설계 (마인드맵)

<a href="/assets/design_mindmap.pdf" target="_blank"><img src="/assets/design_mindmap.png"></a>

### 스크린샷

<a href="/assets/login.gif" target="_blank"><img src="/assets/login.gif" alt="My Image" width="250"></a>
<a href="/assets/secondPage.gif" target="_blank"><img src="/assets/secondPage.gif" alt="My Image" width="250"></a>
<a href="/assets/thirdPage.gif" target="_blank"><img src="/assets/thirdPage.gif" alt="My Image" width="250"></a>

### 데모영상
<a href="https://youtu.be/gRF4_6vAdzI" target="_blank"><img src="/assets/thumnail.png"></a>

<br>

### 협업
* Trello, Github

<a href="/assets/teamwork_trello.png" target="_blank"><img src="/assets/teamwork_trello.png" width=300></a>
<a href="/assets/teamwork_github.png" target="_blank"><img src="/assets/teamwork_github.png" width=450></a>

* Slack (전체 팀 채널과 iOS팀 채널 두 개로 운영)

<a href="/assets/teamwork_slack1.png" target="_blank"><img src="/assets/teamwork_slack1.png" width=350></a>
<a href="/assets/teamwork_slack2.png" target="_blank"><img src="/assets/teamwork_slack2.png" width=350></a>

### 문제해결 아카이브
  * 심장이 두근거리는 애니메이션을 어떻게 구현할까
    * <strong>AnimationKeyFrame</strong>으로 두근거림의 디테일을 해결했다.
  * 사용자가 특별한 조언을 받는 느낌을 받아야 한다.
    * <strong>MotionProximity</strong>를 활용해서 사용자의 손을 센서를 통해 인식할 수 있고 사용자가 단순히 버튼을 누르는 것이 아니라 마술을 부리는 것 같은 느낌을 줄 수 있었다.
  * 깔끔한 디자인의 버튼을 구현하려면 부가설명이 없이 직관적이어야 한다.
    * 다음 화면으로 넘어가는 버튼은 두근거리는 애니메이션을 적용해서 사용자가 직관적으로 누르고 싶게 만들 수 있었다.
    * 되돌아 가기 버튼은 화살표가 반대쪽으로 돌아가는 애니메이션을 적용해서 사용자가 직관적으로 뒤로 간다는 느낌이 들게 만들 수 있었다.

<br>
<br>

---


* 패스트캠퍼스에서 마지막에 진행하는 프로젝트 기간에 만드는 프로젝트.
* Backend 개발자와 협의해서 REST API를 함께 설계
* Frontend, Backend 개발자들과 협업하여 진행하였고, 해당 과정에서 iOS 앱 파트 담당.
* 커스텀 UI(CustomCatetoryTabBar) 만들고 적용.
* 자체 로그인 기능 뿐만 아니라 소셜로그인(카카오톡, 네이버, 구글)기능 구현.
* Backend 개발자와 데이터 구조 설계 경험.
* 서버와 통신해서 서버에서 제공하는 복잡한 JSON Data를 Codable 프로토콜을 이용해서  파싱 경험.
* 소셜 커머스 서비스에서 필수적인 장바구니, 상품 결제시스템 구현.
* 클린 코드를 위한 커밋메세지 규칙, 코드 스타일 가이드라인 정하는 작업 경험
* 복잡한 UI 및 런타임 시점 애니메이션을 모두 Dynamic AutoLayout으로 구현.
* 외부 라이브러리 SnapKit, Kingfisher, SwiftLint 사용 경험.
* Github로 프로젝트 소스코드 관리하고 Slack, Trello로 팀원간 커뮤니케이션과 프로젝트 관리 경험.  
