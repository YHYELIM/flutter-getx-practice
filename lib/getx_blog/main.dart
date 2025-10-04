import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/getx_blog/view/pages/post/home_page.dart';
import 'package:getx_todo_app/getx_blog/view/pages/user/join_page.dart';
import 'package:getx_todo_app/getx_blog/view/pages/user/login_page.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음, GetX 사용할 예정
      home: LoginPage(),

    );
  }
}
