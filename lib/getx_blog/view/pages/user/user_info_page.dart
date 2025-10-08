import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/controller/user_controller.dart';

class UserInfoPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원번호 : ${u.principal.value.id}"),
            Text("회원번호 : ${u.principal.value.username}"),
            Text("회원번호 : ${u.principal.value.email}"),
            Text("회원번호 : ${u.principal.value.created}"),
            
          ],
        ),
      ),
    );
  }
}
