import 'package:flutter/material.dart';

import '../../components/custom_text_form_field.dart';
import '../../components/custon_elevated_button.dart';

class JoinPage extends StatelessWidget {
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
              child: Text('회원가입 페이지', style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
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
            // 백엔드에 데이터를 한꺼번에 보낼거면 Form위젯으로 감싸는것이 좋다
            child: Column(
              children: [
                CustomTextFormField(hint: 'Username'),
                CustomTextFormField(hint: 'Password'),
                CustomTextFormField(hint: 'Email'),
                CustomElevatedButton(text: '회원가입'),
              ],
            ),
          );
  }
}
