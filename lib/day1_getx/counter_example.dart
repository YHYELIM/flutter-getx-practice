import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX 카운터',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterPage(),
    );
  }
}

class CounterController extends GetxController{
  // GetX 상태 관리를 하는 클래스
  // 일반 클래스에 extends GetxController 추가하면 됨

  // 0.obs : 반응형 변수로 만듦
  // 값이 변경되면 자동으로 ui 업텟
  // setState() 필요없음
  var count = 0.obs;

  // 증가 메서드
  void increment(){
    count.value++; // .value로 접근
  }

  // 감소 메서드
  void decrement(){
    if(count.value >0){ // 음수 방지
      count.value--;
    }
  }

  // 초기화 메서드
  void reset(){
    count.value = 0;
  }

// .value인 이유?
// count: RxInt객체(반응형타입) -> 실제 숫자값은 .value 안에 있음
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller 등록 및 가져오기
    // CounterController 인스턴스를 메모리에 등록
    // controller 변수에 할당
    final CounterController controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX 카운터 앱'),
        actions: [
          IconButton(onPressed: controller.reset,  icon: Icon(Icons.refresh),),
        ],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('버튼을 눌러보세요!',style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),

              // Obx로 감싸기
              // Obx(()=>위젯) : 중괄호 안의 반응형 변수 감시
              // counter 변경되면 자동으로 Text위젯만 rebuild
              // 다른 위젯들은 rebuild안됨
              Obx(()=>Text(
                '${controller.count}',// .value 생략가능
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: controller.decrement,
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.red,
                    heroTag: 'minus', ),
                  SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: controller.increment,  // 👈 메서드 연결
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green,
                    heroTag: 'plus',
                  ),
                ],
              ),
              SizedBox(height: 40),
              Obx(()=>Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: controller.count.value > 0 && controller.count.value % 10 == 0
                      ? Colors.orange.shade100
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text( controller.count.value > 0 && controller.count.value % 10 ==0 ? '10의 배수입니다' : ''),

              ))
            ],
          )
      ),
    );
  }
}

