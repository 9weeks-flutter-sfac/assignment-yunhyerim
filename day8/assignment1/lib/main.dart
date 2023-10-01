import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  getUrl();
}

void getUrl() async {
  var dio = Dio();
  int inputInt = 100;

  while (inputInt <= 150) {
    print(inputInt);
    var url = "https://sniperfactory.com/sfac/http_assignment_$inputInt";

    print('url은 $url');

    try {
      var resp = await dio.post(
        url,
        options: Options(
          headers: {
            'user-agent': 'SniperFactoryBrowser',
            'authorization': 'Bearer ey-12312312312312',
          },
        ),
      );
      var data = resp.data["result"];
      print('찾음. $data');
      break;
    } on DioError catch (e) {
      print("에러남. ${e.type}");

      inputInt++;
    }
  }
}
