import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/getx_blog/pages/user/login_page.dart';
import 'package:getx_todo_app/getx_blog/util/validator_util.dart';
import 'package:validators/validators.dart';

import '../../components/custom_text_form_field.dart';
import '../../components/custon_elevated_button.dart';

class JoinPage extends StatelessWidget {
  // 폼의 상테를 관리하는 글로벌 키
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // ListView한 이유?
          // -> TextFormField 사용시 키보드가 올라오기 때문에 스크롤 되어야함
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                '회원가입 페이지',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  // 메서드의 return 타입은 부모 타입 (Widget)으로 잡아주는게 좋다
  Widget _joinForm() {
    return Form(
      // 외부에서도 이 Form을 컨트롤 할 수 있음
      key: _formKey,
      // 백엔드에 데이터를 한꺼번에 보낼거면 Form위젯으로 감싸는것이 좋다
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Username',
            funValidator: validateUsername(),
          ),
          CustomTextFormField(hint: 'Password', funValidator: validatePassword()),
          CustomTextFormField(hint: 'Email',funValidator: validateEmail()),
          CustomElevatedButton(
            text: '회원가입',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(LoginPage());
              }
            },
          ),
        ],
      ),
    );
  }
}
