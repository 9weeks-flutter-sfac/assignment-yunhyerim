# assignment1

# 18일차 과제

<aside>
<img src="/icons/chat_red.svg" alt="/icons/chat_red.svg" width="40px" /> **과제를 진행하기 위해서 아래의 설정을 맞춰주세요.**

하나의 프로젝트에 1, 2, 3번을 모두 구현해주세요.

프로젝트에 컬렉션 (post)를 만들고 2가지 Document를 만들어 다음의 값을 넣도록 한다.

![Untitled](https://sniperfactory.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F862f1a58-bdeb-4e70-aebc-a72d6a7b4003%2FUntitled.png?table=block&id=8618cdfc-1503-4b8b-aa24-6c9268ab4f4b&spaceId=4f763fdd-bbba-45d6-8677-39e1a021e572&width=2000&userId=&cache=v2)

- 문서명은 자동생성할 수 있도록 한다.
- 필드값은 content, likes, title를 같도록 하며, 데이터타입은 다음과 같다.
    - content - string
    - title - string
    - likes - number
</aside>

[제공 코드]

- lib/model/post.dart
    
    ```dart
    // ignore_for_file: public_member_api_docs, sort_constructors_first
    import 'dart:convert';
    
    class Post {
      String? id;
      String title;
      String content;
      int likes;
      Post({
        required this.id,
        required this.title,
        required this.content,
        required this.likes,
      });
    
      Map<String, dynamic> toMap() {
        return <String, dynamic>{
          'id': id,
          'title': title,
          'content': content,
          'likes': likes,
        };
      }
    
      factory Post.fromMap(Map<String, dynamic> map) {
        return Post(
          id: map['id'] as String?,
          title: map['title'] as String,
          content: map['content'] as String,
          likes: map['likes'] as int,
        );
      }
    
      String toJson() => json.encode(toMap());
    
      factory Post.fromJson(String source) =>
          Post.fromMap(json.decode(source) as Map<String, dynamic>);
    }
    ```
    
- lib/view/page/assignment_page.dart
    
    ```dart
    import 'package:cloud_firestore/cloud_firestore.dart';
    import 'package:flutter/material.dart';
    
    class AssignmentPage extends StatefulWidget {
      const AssignmentPage({super.key});
    
      @override
      State<AssignmentPage> createState() => _AssignmentPageState();
    }
    
    class _AssignmentPageState extends State<AssignmentPage> {
      var ref = FirebaseFirestore.instance.collection('post').withConverter(
        fromFirestore: (snapshot, _) => Post.fromMap(snapshot.data()!),
        toFirestore: (data, _) => data.toMap(),
      );
    
      Future<List<QueryDocumentSnapshot<Post>>> readData() async {
        var items = await ref.get();
        return items.docs;
      }
    
      // likesUp(String id) => ref.doc(id).update(...);
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: FutureBuilder<List<QueryDocumentSnapshot<Post>>>(
              future: readData(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(snapshot.data![index].data().title),
                      subtitle: Text(snapshot.data![index].data().content),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: (){},
                        // onPressed: () => likesUp(snapshot.data![index].id),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        );
      }
    }
    ```
    
1. **위의 제공된 코드의 주석을 해제하면 다음과 같이 구현이 가능하다.
trailing의 IconButton을 클릭하면 해당 포스트의 좋아요 수가 +1만큼 올라간다.
주석을 해제하고, 코드를 알맞게 작성하시오.**
    
    ![likes.gif](https://file.notion.so/f/s/36b81ec3-6fed-471f-b2ae-5b6b04d505db/likes.gif?id=f3991419-019f-4be1-8402-c4a93a337b39&table=block&spaceId=4f763fdd-bbba-45d6-8677-39e1a021e572&expirationTimestamp=1698069600000&signature=G2ZgrFexCHynHH20xVrPLXYUdTfnEW9cRH5xLtOT42s)
    
    - FieldValue를 사용하여 해결할 것
    
2. **Firebase의 Authentication을 통하여 다음 중 하나를 선택하여 구현하여 프로젝트에 적용하시오.**
    - Apple
    - Facebook

1. 인증된 사용자가 올바른 유저인지 구별하기 위해서 이메일로 가입된 유저에 한해 email verification을 진행할 수 있다.
    - **Email Verification을 진행하는 방법을 알아보고
    로그인 된 사용자에 한해 인증된 사용자의 경우 다음과 같이 나올 수 있도록 플러터 화면에 표시하시오.**
        - 이메일 인증을 하지않은 유저의 경우
            
            ![Untitled](https://sniperfactory.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc68b1fc2-1e2d-4f60-aabd-8d483cb12743%2FUntitled.png?table=block&id=7b141750-792e-460b-b14f-a4da9ce063a9&spaceId=4f763fdd-bbba-45d6-8677-39e1a021e572&width=860&userId=&cache=v2)
            
        - 이메일 인증이 진행된 유저의 경우
            
            ![Untitled](https://sniperfactory.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F577e20ac-d539-4fc5-917b-1a33bad8ecda%2FUntitled.png?table=block&id=89868c4e-2d4b-4f12-ae45-5b7cd65a404e&spaceId=4f763fdd-bbba-45d6-8677-39e1a021e572&width=860&userId=&cache=v2)