import 'package:get/get.dart';
import 'package:getx_todo_app/getx_blog/util/jwt.dart';

const host = "http://172.30.1.68:8080";
// 통신
class PostProvider extends GetConnect{
  // Map 타입으로 데이터 날림
  // Future : 통신이기때문에 응답 받을 때 까지 시간이 걸림 Future가 없으면 null 값이 들어옴
  // Promist (데이터 약속)
  Future<Response> findAll () => get("$host/post", headers: {"Authorization" : jwtToken ?? ""});

  Future<Response> findById (int id) => get("$host/post/$id", headers: {"Authorization" : jwtToken ?? ""});
}