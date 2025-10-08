import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/controller/post_controller.dart';
import 'package:getx_todo_app/getx_blog/controller/user_controller.dart';
import 'package:getx_todo_app/getx_blog/view/pages/post/update_page.dart';
import 'package:getx_todo_app/getx_blog/view/pages/post/home_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // arguments: dynamic 타입이라 뭘로 받을지 정해주면 됨
    // String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();
    print ("로그인 유저 아이디 : ${u.principal.value.id}");

    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 아이디 : $id, 로그인 상태 : ${u.isLogin}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          children: [
            Text(
              "${p.post.value.title}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Divider(),
            u.principal.value.id == p.post.value.user!.id ?Row(
              children: [
                ElevatedButton(onPressed: () async{
                  await p.deleteById(p.post.value.id!);
                  Get.off(HomePage());
                  // 상태관리로 갱신 시킬 수 있음
                }, child: Text('삭제')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {
                  Get.to(UpdatePage());
                }, child: Text('수정')),
              ],
            ) : SizedBox(),
            Expanded(
              // SingleChildScrollView: 글 하나가 들어옴으로  사용
              // SingleChildScrollView는 높이를 지정해줘야함  -> Expanded 사용
              child: SingleChildScrollView(child: Text("${p.post.value.content}")),
            ),
          ],
        ),),
      ),
    );
  }
}
