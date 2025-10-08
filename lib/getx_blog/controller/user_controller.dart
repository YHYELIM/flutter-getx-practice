import 'package:get/get.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_repository.dart';
import 'package:getx_todo_app/getx_blog/util/jwt.dart';

class UserController extends GetxController{

  final  _userRepository = UserRepository(); // final : 타입 추론 -> 타입 생략 가능
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = User().obs;


  void logout (){
    isLogin.value = false;
    jwtToken = null;
  }


  Future<int> login (String username, String password) async{
    // userRepository에서 기다리니까 당연히 여기도 기다려야함
    User principal = await _userRepository.login(username, password);

    if(principal.id != null){
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    }else{
      return -1;
    }
  }
}