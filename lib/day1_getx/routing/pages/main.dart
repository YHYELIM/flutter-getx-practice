import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/day1_getx/counter_example.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX 라우팅',
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🏠 홈 화면입니다',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),

            // 버튼 추가
            ElevatedButton(
              onPressed: () {
                Get.to(()=>SecondPage());
                print('버튼 클릭!');
              },
              child: Text('두 번째 페이지로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두 번째 페이지'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '📱 두 번째 화면입니다',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 40),

            ElevatedButton(onPressed: (){
              Get.back();
            },
              child: Text('← 뒤로 가기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),

      ),
    );
  }
}