import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../../model/member.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Member? member;
  bool isUserExisted = false;

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      setState(() {
        isUserExisted = true;
      });
    } else {
      return null;
    }
  }

  sendEmailVerification() async {
    //인증 이메일 보내기
    if (!FirebaseAuth.instance.currentUser!.emailVerified) {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    }
  }

  getFacebookUserData() async {
    var userData = await FacebookAuth.instance.getUserData();
    print(userData);
  }

  logOut() {
    FirebaseAuth.instance.signOut();
    isUserExisted = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isUserExisted)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${FirebaseAuth.instance.currentUser?.email}"),
                  FirebaseAuth.instance.currentUser!.emailVerified
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "이메일이 인증된 사용자 입니다.",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      : TextButton(
                          onPressed: sendEmailVerification,
                          child: Text(
                            "이 곳을 눌러 이메일 인증을 해주세요",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ))
                ],
              ),
            IconButton(
              onPressed: () {
                signInWithFacebook();
              },
              icon: Icon(Icons.facebook),
            ),
            IconButton(onPressed: logOut, icon: Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }
}
