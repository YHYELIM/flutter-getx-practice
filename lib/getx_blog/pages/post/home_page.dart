import 'package:flutter/material.dart';
import 'package:getx_todo_app/getx_blog/size.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(title: Text('제목1'), leading: Text("1"));
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
                onPressed: () {},
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
                onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
