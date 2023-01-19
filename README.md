# Tuist.io

<img width="500" height="500" src="https://user-images.githubusercontent.com/23008224/211808819-f9776dbf-bb29-4cdb-b180-3983765aab03.png" alt="github-icon" style="zoom:25%;"/>


## Tuist.io - Study Day

| Study Day  | 목적                                                       |
| --------------- | ---------------------------------------------------------- |
| `Tuist`     | Tuist io, Tuist init, Tuist Method                                    |
| `Tuist Project 생성` | 비즈니스 로직 분리, UI Configure                           |



## Tuist 명령여
`tuist init --platform ios` : 초기 프로젝트 파일 생성 하기 위한 명령어 <br>
`tuist clean` : generate로 생성된 모든 데이터를 제거 <br>
`tuist fetch` : 외부 종속성(dependency) 불러오기 위한 명령어 <br>
`tuist generate` : xcworkspace,xcworproj 파일 생성하기 위한 명령어 <br>
`tuist edit` : Project.swift(Manifests) 파일을 수정하기 위한 명령어 <br>
`tuist build` : 프로젝트를 Build 하기 위한 명령어 <br>

## 그외 명령어
`mkdir` : directory 생성을 하기 위한 명령어

## 알아두어야 할것 😎
`tuist init --platform ios` : 명령어 실행시 Targets에 있는 Sources, Resources directory가 생성되며 이 directory를 통해 Project Method를 설정
- `sources: ["Sources/**"]` : 프로젝트 경로에 Sources directory가 없다면 glob Pattern Error!! 👾




```swift
let project = Project(
    name: "Tuist",
    packages: [],
    targets: [
        Target(
            name: "Tuist",
            platform: .iOS,
            product: .app,
            bundleId: "com.project.Tuist",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone,.ipad]),
            infoPlist: .default,
            sources: ["Sources/**"], //MARK: --> Sources Root  Directory Settings 
            resources: ["Resources/**"], //MARK: --> Resources Root Directory Settings
            dependencies: [],
            settings: nil
        ),
        Target(
            name: "TuistTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.project.Tuist",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Tuist")
            ]
        )
    
    ]
)
```



### Settings Type

`struct Settings` : 그룹 세팅을 위한 구성

#### Topics!!

`enum DefaultSettings` : 모든 프로젝트 그리고 타켓의 기본 적용대상으로 하며 기본 설정 및 세팅으로 지정하며, 재정의를 통해 기본 세팅을 한다.

`enum Configuration` : 프로젝트 또는 타겟 빌드 설정을 `.xcconfig`, `.debug`, `.release` 로 설정 합니다.

`enum SettingValue` :  컬렉션 타입 값 또는 Value을 사용하여 세팅

- ⭐️ Enumration Cases
  - `case array([String])` -> Collection type
  - `case string(String)` -> Value Type

        
## 🎨 Instance Properties 

- `base: SettingsDictionary` : 모든 구성에서 상속되며 빌드 설정이 있는 Dictionary
- `configurations: [Configuration]`
- `defaultSettings: DefaultsSettings`


## ✏️ Type Methods



```swift
static func settings(base: SettingsDictionary, configurations: [Configuration], defaultSettings: DefaultsSettings) -> Settings
static func settings(base: SettingsDictionary, debug: SettingsDictionary, release: SettingsDictionary, defaultSettings: DefaultsSettings) -> Settings
```




