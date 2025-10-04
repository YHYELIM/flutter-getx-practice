import 'package:get/get.dart';

const host = "http://172.30.1.63:8080";
// 통신
class UserProivder extends GetConnect{
  // Map 타입으로 데이터 날림
  // Future : 통신이기때문에 응답 받을 때 까지 시간이 걸림 Future가 없으면 null 값이 들어옴
  // Promist (데이터 약속)
  Future<Response> login (Map data) => post("$host/login", data);

}