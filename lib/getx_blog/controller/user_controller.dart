import 'package:get/get.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_repository.dart';
import 'package:getx_todo_app/getx_blog/util/jwt.dart';

class UserController extends GetxController{

  final UserRepository _userRepository = UserRepository();

  Future<void> login (String username, String password) async{
    // userRepository에서 기다리니까 당연히 여기도 기다려야함
    String token = await _userRepository.login(username, password);
    jwtToken = token;
    print("jwtToken:: $jwtToken");
  }
}