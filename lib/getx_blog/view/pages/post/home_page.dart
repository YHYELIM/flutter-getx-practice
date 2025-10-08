import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/controller/post_controller.dart';
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
    // put : 객체 생성 (create),onInit 함수 실행 (initialize)
    PostController p = Get.put(PostController());
    // p.findAll(); 여기서 응답을 받으면 안됨 ->받으려면 async,await 사용해야하는데 그렇게 되면 응답 다운이 될때까지 화면이 멈춰버려서 ux가 안좋아짐

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text('${u.isLogin}'),
      ),
      body: Obx(()=> ListView.separated(
        itemCount: p.posts.length, // post 갯수만큼
        itemBuilder: (context, index) {
          return ListTile(
              onTap: ()async{
                // 클릭할때 findById 만들어진 상태에서 DetailPage 이동
                // DetailPage에서 obx로 접근하면 끝
                // 얘도 기다려줘야함
                await p.findById(p.posts[index].id!);
                Get.to(()=> DetailPage(p.posts[index].id));
                // index가 돌면서 차례대로 값 넘김
                //arguments: '안녕'

              },
              title: Text('${p.posts[index].title}'),
              leading: Text('${p.posts[index].id}'));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),),
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
