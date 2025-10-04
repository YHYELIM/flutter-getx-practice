import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/view/pages/post/update_page.dart';

import '../../../../day1_getx/routing/pages/main.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // arguments: dynamic 타입이라 뭘로 받을지 정해주면 됨
    // String data = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '글 제목 !!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {
                  Get.off(HomePage());
                  // 상태관리로 갱신 시킬 수 있음
                }, child: Text('삭제')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {
                  Get.to(UpdatePage());
                }, child: Text('수정')),
              ],
            ),
            Expanded(
              // SingleChildScrollView: 글 하나가 들어옴으로  사용
              // SingleChildScrollView는 높이를 지정해줘야함  -> Expanded 사용
              child: SingleChildScrollView(child: Text('글 내용 !!' * 500)),
            ),
          ],
        ),
      ),
    );
  }
}
