import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List items = [];
  var instance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: readFromCloudFireStore,
              child: const Text("가져오기"),
            ),
            TextButton(
              onPressed: () {
                getDocument("JmSLvCBMaWqHKAtq1JqL");
                getDocument("kqlwjinKSEL5QlDpBHrD");
              },
              child: const Text("하나만 가져오기"),
            ),
            TextButton(
              onPressed: () {
                readFinishedDocument();
              },
              child: const Text("finished만 가져오기"),
            ),
            TextButton(
              onPressed: () {
                createDocument("책방가서 책읽기");
              },
              child: const Text("문서 추가"),
            ),
            TextButton(
              onPressed: () {
                createDocumentById('123456789', '노래방가서 노래부르기');
              },
              child: const Text("문서 추가(지정아이디)"),
            ),
            TextButton(
              onPressed: () {
                updateDocument('123456789', {'isFinished': true});
              },
              child: const Text("문서 수정"),
            ),
            TextButton(
              onPressed: () {
                deleteDocument('123456789');
              },
              child: const Text("문서 삭제"),
            ),
            if (items.isNotEmpty)
              ...items.map((e) => Text(e['title'])).toList() //spread 문법
          ],
        ),
      ),
    );
  }

  readFromCloudFireStore() async {
    //해당 컬렉션의 문서들을 가져온다.
    var res = await instance.collection("memo").get();
    print(res.docs);
    var data = res.docs.first;
    print(data.data());
    setState(() {
      items = res.docs.map((e) => e.data()).toList();
    });
  }

  getDocument(String documentId) async {
    //해당컬렉션의 선택 문서를 하나만 가져온다.
    var res = await instance.collection("memo").doc(documentId).get();
    print(res.data());
  }

  readFinishedDocument() async {
    //해당 컬렉션에 필터를 걸고 해당되는 문서들을 가져온다.
    var res = await instance
        .collection('memo')
        .where('isFinished', isEqualTo: true)
        .get();
    print(res.docs);
    print(res.size);
  }

  //Create
  //데이터를 생성한다.
  //Docid 자동 생성(unique auto-generated)
  createDocument(String title) async {
    var res = await instance
        .collection('memo')
        .add({"title": title, "isFinished": false});
  }

  //지정 DocId(set)
  //ex)userId를 documentId로 쓸때..
  //이미 존재하는 id면 SetOption(merge: true)값으로 새로운 값으로 덮어씌울수 있음
  createDocumentById(String docId, String title) async {
    var res = await instance.collection('memo').doc(docId).set({
      'title': title,
      'isFinished': false,
    });
  }

  //Update 데이터 수정
  updateDocument(String docId, Map<String, dynamic> data) {
    instance.collection('memo').doc(docId).update(data);
  }


  //문서 삭제
  deleteDocument(String docId) {
    instance.collection('memo').doc(docId).delete();
  }
}
