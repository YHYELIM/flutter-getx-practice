import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_repository.dart';
import 'package:getx_todo_app/getx_blog/view/pages/post/home_page.dart';
import 'package:getx_todo_app/getx_blog/view/pages/user/join_page.dart';
import 'package:getx_todo_app/getx_blog/util/validator_util.dart';

import '../../components/custom_text_form_field.dart';
import '../../components/custon_elevated_button.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                '로그인 페이지',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Username',
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            hint: 'Password',
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: '로그인',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                // Get.to(LoginPage());
                UserRepository u = UserRepository();
                u.login("ssar", "1234");
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
