import 'package:get/get.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_repository.dart';
import 'package:getx_todo_app/getx_blog/util/jwt.dart';

class UserController extends GetxController{

  final  _userRepository = UserRepository(); // final : 타입 추론 -> 타입 생략 가능
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트

  void logout (){
    isLogin.value = false;
    jwtToken = null;
  }


  Future<String> login (String username, String password) async{
    // userRepository에서 기다리니까 당연히 여기도 기다려야함
    String token = await _userRepository.login(username, password);

    // 토큰이 정상 응답일때만 저짐
    if (token != "-1"){
      isLogin.value = true;
      jwtToken = token;
      print("jwtToken:: $jwtToken");
    }
    return token;
  }
}