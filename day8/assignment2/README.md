과제 1. 다음 화면을 구현해봅니다.

![8.gif](https://file.notion.so/f/f/4f763fdd-bbba-45d6-8677-39e1a021e572/b16fc00f-67f1-46fc-827d-3cec371e6af6/8.gif?id=1473d633-83d8-4341-b0db-fada56aa12e0&table=block&spaceId=4f763fdd-bbba-45d6-8677-39e1a021e572&expirationTimestamp=1697824800000&signature=lzlIe77cLtGRkK_mIGI9h7ySzRBX6d1rBpNlzmQOCQg)

- 다음의 URL에 데이터를 요청하여 문제를 해결합니다.
    - https://sniperfactory.com/sfac/http_day16_dogs
- 디바이스가 인터넷에 연결돼있는지 확인하는 패키지를 사용합니다.
    - **패키지명 : connectivity_plus**
    - FAB을 누르면 인터넷이 연결되어있는지 확인합니다.
    - 인터넷 연결을 확인중일 때 “인터넷 확인 중 입니다”와 로딩 위젯을 보여줍니다.
        - 이 때, 로딩 위젯은 어떠한 것이든 상관없습니다.
- 화면을 아래로 당기면 데이터를 새로 요청할 수 있도록 패키지를 사용합니다.
    - **패키지명 : pull_to_refresh**
- 데이터를 가져올 때 사용자에게 데이터가 로딩중이라는 것을 알려줄 수 있도록 패키지를 활용합니다.
    - **패키지명 : Shimmer**
- 위 기능을 우선적으로 구현하며, 최대한 자연스러운 UX를 구현할 수 있도록 합니다.
그 외 과제를 위한 기능 및 디자인은 자유입니다.