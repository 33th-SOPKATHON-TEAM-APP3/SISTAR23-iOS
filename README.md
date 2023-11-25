# 🍀 왔당 (What Dang)
: 뭐가 당연하냐는 뜻.

## 🙆🏻‍♀️🙅🏻‍♂️ 프로젝트 설명 
🌟 33rd SOPT 해커톤, "솝커톤" iOS 3조
~~~
"어라라..이런 상황이 나에게 닥친다면?"

일상속에서 당신이 놓치고 있던 당연함의 부재를 통해 나를 파악하는 기록 서비스
~~~


## 🍎 역할 분담 및 주요 기능
| 이민재 | 전효원 | 김선우 | 윤영서 |
| :--------: | :--------: | :--------: | :--------: |
| <img src="https://github.com/33th-SOPKATHON-TEAM-APP3/SISTAR23-iOS/assets/102219161/0aacc5c3-3066-430f-bd1e-472e60527bd1" width="200px"/> | <img src="https://github.com/33th-SOPKATHON-TEAM-APP3/SISTAR23-iOS/assets/102219161/66a1e798-0155-44e8-b1d7-d7350cef76aa" width="200px"/> | <img src="https://github.com/33th-SOPKATHON-TEAM-APP3/SISTAR23-iOS/assets/102219161/fc955987-9966-4ef5-850e-b3d709cc9186" width="200px"/> | <img src="https://github.com/33th-SOPKATHON-TEAM-APP3/SISTAR23-iOS/assets/102219161/74b7f8e5-8a5f-4661-b89f-43aa174d281b" width="200px"/> |
| Archiving List View | Splash / Popup View | Text-field View | Archiving Detail View |
| 답변 완료된 질문 랜덤 리스트 | 스플래쉬 화면 및 분기 처리 | 매일 다른 질문에 대한 답변 | 매일 자신과 다른 유저의 답변 확인 |


## Git Convention
~~~
1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. Add - Commit - Push - Pull Request 의 과정을 거친다.
4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
5. Code Review가 완료되면 Pull Request 작성자가 develop Branch로 merge 한다.
6. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.
~~~

## Commit Convention
[😼 씨스타23이들의 커밋 컨벤션 😽](https://www.notion.so/Git-Convention-d3f6028db0184070bfbc75cccb5e7016?pvs=4)
<br/>


## 씨스타23이들의 일상
| Before | After |
| :--------: | :--------: | 
| <img width="50%" alt="image" src="https://github.com/33th-SOPKATHON-TEAM-APP3/SISTAR23-iOS/assets/102219161/7a36a39b-b6fb-4175-a330-0883cc3a6424"> | <img width="50%" src="https://github.com/33th-SOPKATHON-TEAM-APP3/SISTAR23-iOS/assets/102219161/65d9728f-f8d4-45e4-b2d7-de2101f1968a"> |



## 📂 Foldering Convention
```bash
├── 📁 Application
│   ├── AppDelegate
│   ├── SceneDelegate
├── 📁 Global
│   ├── 🗂️ Resources
│   │   ├── 🗂️ Font
│   │   ├── Assets
│   ├── 🗂️ Literals
│   ├── 🗂️ Extension
│   ├── 🗂️ Protocols
│   ├── 🗂️ Utils
│   ├── 🗂️ Supporting Files
│   │   ├── LaunchScreen
├── 📁 Network
│   ├── 🗂️ Environment
│   ├── 🗂️ Base
│   ├── 🗂️ Entity
│   ├── 🗂️ Services
├── 📁 Presentation
│   ├── 🗂️ Splash
│   ├── 🗂️ Question
│   ├── 🗂️ SaveComplete
│   ├── 🗂️ Archiving
│   ├── 🗂️ ArchivingDetatil
│   │   │   ├── 🗂️ Cell
│   │   │   ├── 🗂️ View
│   │   │   ├── 🗂️ ViewController
├── Info.plist
``` 
