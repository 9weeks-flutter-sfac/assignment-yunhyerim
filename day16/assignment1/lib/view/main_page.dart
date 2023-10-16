// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = "/main";

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    var token = Get.find<AuthController>().token!;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentPage.value,
          onTap: controller.onPageTapped, //tap하면 페이지 넘어가게
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "My")
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(
              children: [
                Text(
                  "${user.username}님 안녕하세요",
                  style: TextStyle(fontSize: 32),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.documents!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.documents![index].title),
                            Text(controller.documents![index].content),
                            SizedBox(
                              height: 8,
                            ),
                            // Text(controller.documents![index].sec_level),
                            controller.documents![index].attachment_url != null
                                ? Image.network(
                                    controller
                                        .documents![index].attachment_url!,
                                    width: double.infinity,
                                  )
                                : SizedBox(
                                    height: 16,
                                  )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: Text("로그아웃하기"),
                  leading: Icon(Icons.logout),
                  onTap: controller.logout,
                  // 잘못쓰면 어플 실행할때 계속 실행됨.
                  // onTap: ()=>controller.logout(),
                )
              ],
            ),
            Text("page1"),
            Text("page2"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.readDocuments(token);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
