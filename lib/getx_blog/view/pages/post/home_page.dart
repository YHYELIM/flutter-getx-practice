import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/controller/user_controller.dart';
import 'package:getx_todo_app/getx_blog/view/pages/post/write_page.dart';
import 'package:getx_todo_app/getx_blog/view/pages/user/user_info_page.dart';
import 'package:getx_todo_app/getx_blog/size.dart';

import '../user/login_page.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  // put : 없으면 만들고, 있으면 찾기!!
  // 앞에 UserController 만들어놨으니까 find만 함
  // UserController u = Get.put(UserController());
  // find할때는 타입만 적어주면 알아서 찾아줌
  UserController u = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text('${u.isLogin}'),
      ),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              Get.to(DetailPage(index));
              // index가 돌면서 차례대로 값 넘김
              //arguments: '안녕'

            },
              title: Text('제목1'),
              leading: Text("1"));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  // 이 페이지에서만 사용함 -> method
  // 다른 페이지에서도 사용함 -> widget

  Widget _navigation(BuildContext context) {

    UserController u = Get.find();
    return Container(
      width: getDrawerWidth(context), // 현재 화면의 context를 넘김
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(WritePage());
                },
                child: Text(
                  '글쓰기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.to(UserInfoPage());
                },
                child: Text(
                  '회원정보보기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  u.logout();
                  Get.to(LoginPage());
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
