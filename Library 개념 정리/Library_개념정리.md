
## Static Library

- 코드 재사용성 : 여러 앱에 걸쳐 공통된 긴으을 가지고 있다고 가정하면, 이러한 공통 소스 코드를 사용하여 정적 라이브러리를 만들고 모든앱에서 공유 가능
- 코드 추상화 : 헤더를 `private` 또는 `Internal`로 표시하여 클라이언트 앱이 알리지 않아야 하는 코드를 숨길 수 있음
- 코드 캡슐화 : 구현 세부 정보를 클라이언트에 숨길 수 있음



### 🤗 정적 라이브러리 패키징 흐름

![image](https://user-images.githubusercontent.com/20410193/141237727-2fc18b79-7696-4775-b499-530d139aeb50.png)

### static Library 장점 

- static Library는 코드 재사용성과 추상화에 좋음 동적 라이브러리에 비해서도 단점이 거의 없지만, 아래의 상황을 잘 고려 해야 한다.

  - 더 큰 앱 크기 : 정적 라이브러리 개체 파일이 ***앱 바이너리에 직접 복사 되기 때문에 앱 크기가 부풀려짐.***  동적 라이브러리는 앱에 lossely Link 되어 있는 반면 정적 라이브러리는 앱에 hard link 되어 있음.
  - 예를 들어 **UIKit과 같은 시스템 프레임 워크는 필요할 때 로드되고 앱은 참조만 유지하므로 사용자가 다운로드할 앱 크기에 추가되지 않음**   

  - **리소스** : 정적 라이브러리는 소스 코드의 모음일 뿐이므로 많은 기능에 필수적인 **Assets, Xibs, Storyboards 및 JSON과 같은 리소스를 가질수 없음**



## Static Library VS Dynamic Library



### 📚 Static Library

- 해당 앱이 사용하는 라이브러리 코드가 **Static Linker**에 의해 생성된 앱 실행 파일 **App Executable**에 직접 복사됨
- 시스템이 앱을 로드할 때 **정적 라이브러리 기능을 단일 앱 실행 파일에 로드함. 따라서 로드/실행 시간이 더 빨라짐**

![image](https://user-images.githubusercontent.com/20410193/141237742-d2479471-c489-44b2-b540-7c5b071a5b5a.png)





### 📦 Dynamic Library

- Static Linker에 의해 앱 실행 파일 **App Executable에  라이브러리 참조만 배치 됨**
- 실제 linking은 앱 실행 파일 **App Executable**과 동적 라이브러리**Dynamic Library**가 메모리에 배치될 때, **Dynamic Linker에 의해 Launch Time 또는 Run Time에 수행됨**

![image](https://user-images.githubusercontent.com/20410193/141237923-02c9dd2c-301e-46f1-9b50-970e72d1a187.png)





## 🧑‍💻 실행 시간 및 메모리 풋 프린트(Lanuch Times and Memory FootPrints)

- Static
  - 라이브러리 코드가 **실행 파일(App Executable)에 직접 복사됨에 따라 많은 정적 라이브러리를 앱에 연결하면 큰앱 실행 파일이 생성 됨**
  - **대용량 실행파일이 있는 응용 프로그램은 느린 시작 시간과 큰 메모리 공간으로 어려움을 겪음**
- Dynamic
  - 실행시 또는 **런타임에 실제로 필요할때 코드가 앱의 주소 공간에 로드**
  - **런타임 연결은 더 빠른 시작 시간과 더 적은 메모리 공간을 제공**

 
