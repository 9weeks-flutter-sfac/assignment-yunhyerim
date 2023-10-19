import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends GetView<UserListController> {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: controller.getUserList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Obx(
                () => ListView.builder(
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage("assets/karaoke.png"),
                        backgroundColor: Colors.white38,
                        radius: 24,
                      ),
                      title: Text(
                        "${controller.users[index].username}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ZoomIn(
        child: FloatingActionButton(
          onPressed: controller.logout,
          child: Icon(Icons.logout),
          backgroundColor: Colors.amberAccent.shade400,
        ),
      ),
    );
  }
}
