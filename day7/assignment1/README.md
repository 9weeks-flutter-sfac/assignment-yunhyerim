# assignment1

- **제공되는 단어데이터를 활용하여 다음의 UI를 만들어주세요.**
    - **단어 데이터 확인하기 (기본 5개이며 추가가능, 본인의 단어 데이터 활용가능)**
```Dart
List<Map<String, String>> words = [
{
"word": "apple", 
"meaning": "사과", 
"example": "I want to eat an apple"
},
{
"word": "paper", 
"meaning": "종이", 
"example": "Could you give me a paper"
},
{
"word": "resilient",
"meaning": "탄력있는, 회복력있는",
"example": "She's a resilient girl"
},
{
"word": "revoke",
"meaning": "취소하다",
"example": "The authorities have revoked their original decision to allow development of this rural area."
},
{
"word": "withdraw",
"meaning": "철회하다",
"example": "After lunch, we withdrew into her office to finish our discussion in private."
},
];

```

![](/assets/word_app.gif)

- **Requirements**
  - FloatingActionButton이 두 개가 떠있는 형태로, 양쪽에 위치합니다.
      - 왼쪽 버튼을 클릭하면, 이 전 단어로 이동합니다.
      - 오른쪽 버튼을 클릭하면, 이 다음 단어로 이동합니다.
  - ThemeData.dark() 를 활용합니다.
  - 단어와 뜻의 자간을 -1만큼 좁혀봅니다. 예문은 1만큼의 자간을 갖도록 합니다.
  - 단어는 최소 5개 이상으로 준비합니다.