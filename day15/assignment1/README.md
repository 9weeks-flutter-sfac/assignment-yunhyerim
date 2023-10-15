# assignment1

# 15일차(오프라인) 과제

![coinapp.gif](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/73aa279e-bd15-4811-bd33-abc1d344b4ca/coinapp.gif)

1. **위의 결과물처럼 메인페이지에서의 코인이 1초마다 +1씩 되도록 만드시오.**
    - 사용된 비트코인은 FontAwesome의 아이콘을 활용한다.
        
        ```dart
        Icon(
            FontAwesomeIcons.bitcoin,
            size: 96.0,
            color: Colors.yellow.shade700,
        ),
        ```
        
2. **CoinController를 만들고, GetxController를 extends하여 위와 같은 결과물을 만들 수 있도록 하시오.**
    - 코인은 int형의 데이터를 가지며, 관측가능한 형태의 데이터타입으로 사용한다.
    - 이 때 Timer를 사용할 수 있도록 한다.
    - 코인이 10의 배수가 될때 마때, 코인 10n개를 달성했다는 안내문구를 출력하도록 한다.
    (Getx의 워커중 상황에 맞는 올바른 워커를 사용할 것)
3. **[상점으로 이동하기] 버튼을 누르면 상점 페이지로 이동한다.**
    - 상점페이지에서도 보유한 코인을 볼 수 있다.
    - 코인 리셋을 누르면 보유한 코인이 다시 0개로 바뀐다.

1. **GetxController를 활용하여 다음의 정보를 포함하고있는 “전역”컨트롤러를 만드시오 
(위와 같은 프로젝트에 만들기)**
- 컨트롤러명은 다음과 같다.
    - AppSettingController
- 포함되어야 하는 멤버변수는 다음과 같다.
    
    
    | bool | isSoundOn |
    | --- | --- |
    | bool | isNotificationOn |
    | String | appVersion |
    | String | appName |
    | String | appAuthor |
    | String | appPackageName |
    | DateTime? | lastUpdated |
- 위 데이터를 메인페이지에서 Get.put하여 전역에서 사용할 수 있도록 등록하고, 최소 두 페이지 이상에 Get.find하여 해당 데이터를 불러올 수 있도록 하시오.
- 페이지 명, 페이지 수는 상관없으며 임의로 존재하는 페이지로 한다.
이 때 페이지들은 서로 네비게이션을 다음과 같이 할 수 있도록 한다.
```dart
Get.to(()=>페이지명());
```