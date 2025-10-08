import 'package:get/get_connect/http/src/response/response.dart';
import 'package:getx_todo_app/getx_blog/controller/dto/LoginReqDto.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_provider.dart';

import '../../controller/dto/CMRespDto.dart';
import '../../util/jwt.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class UserRepository {
  final UserProivder _userProivder = UserProivder();

  Future<User> login(String username, String password) async {
    // username, password를 받아서 Map타입으로 만들어서 넣어야함
    LoginReqDto loginReqDto = LoginReqDto(username, password); // Dart 클래스 오브젝트

    Response response = await _userProivder.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    Cmrespdto cmrespdto = Cmrespdto.fromJson(body);
    // print(cmrespdto.code);
    // print(cmrespdto.msg);
    // print(cmrespdto.data);
    // print(cmrespdto.data.runtimeType);// 런타임시 타입을 알 수 있음

    // 응답 타입 : List<dynamic>
    // 응답 성공시 List<Post> 타입으로 바꿔준다
    if(cmrespdto.code == 1){
      User principal = User.fromJson(cmrespdto.data);

      String token = headers["authorization"];
      jwtToken = token;
      print("jwtToken:: $jwtToken");
      return principal;
      return principal;
    } else {
      return User();
    }
  }
    // if (headers["authorization"] == null || headers["authorization"].toString().contains("null")) {
    //   return "-1";
    // } else {
    //   String token = headers["authorization"];
    //   return token;
    // }

}

// login 함수 호출
// LoginReqDto 객체로 만들어서 Map타입 으로 해서 _userProivder로 던짐
// 근데 통신이니까 바로 delay 고려해서 기다려라고 하는거임
