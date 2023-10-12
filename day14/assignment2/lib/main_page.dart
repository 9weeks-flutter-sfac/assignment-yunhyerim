// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'detail_profile_page.dart';
import 'model/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Profile> profileList = [];

  Dio dio = Dio();

  String url = "https://jsonplaceholder.typicode.com/users";

  void getProfileDataList() async {
    var res = await dio.get(url);

    if (res.statusCode == 200) {
      var mapList = List<Map<String, dynamic>>.from(res.data);
      profileList = mapList.map((e) => Profile.fromMap(e)).toList();

      print(profileList[0].id);
      print(profileList.length);
    }

    addProfileImage();

    setState(() {});
  }

  void addProfileImage() {
    for (int i = 0; i < profileList.length; i++) {
      profileList[i].profileImage =
          "https://xsgames.co/randomusers/assets/avatars/male/${profileList[i].id}.jpg";
    }

    print("=========== 프로필 이미지 추가 : ${profileList[0]}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileDataList();
    print("=========initstate");
  }

  @override
  Widget build(BuildContext context) {
    // getProfileDataList();
    print("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Contacts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: profileList.length,
        itemBuilder: (context, index) {
          var profileName = profileList[index].name;
          var profileEmail = profileList[index].email;
          return FadeInRight(
            delay: Duration(milliseconds: 100 * index),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profileList[index].profileImage!),
              ),
              title: Text(profileName),
              subtitle: Text(profileEmail),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProfilePage(
                          name: profileName,
                          email: profileEmail,
                          phone: profileList[index].phone,
                          address: profileList[index].address,
                          company: profileList[index].company,
                          profileImage: profileList[index].profileImage!,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
            ),
          );
          // return Text(profileList[index].name);
        },
      ),
    );
  }
}
