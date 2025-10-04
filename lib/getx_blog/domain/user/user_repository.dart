import 'package:get/get_connect/http/src/response/response.dart';
import 'package:getx_todo_app/getx_blog/controller/dto/LoginReqDto.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class UserRepository {
  final UserProivder _userProivder = UserProivder();

  Future<String> login(String username, String password) async {
    // username, password를 받아서 Map타입으로 만들어서 넣어야함
    LoginReqDto loginReqDto = LoginReqDto(username, password); // Dart 클래스 오브젝트

    Response response = await _userProivder.login(loginReqDto.toJson());

    dynamic headers = response.headers;
    String token = headers["authorization"];
    return token;

  }
}

// login 함수 호출
// LoginReqDto 객체로 만들어서 Map타입 으로 해서 _userProivder로 던짐
// 근데 통신이니까 바로 delay 고려해서 기다려라고 하는거임
