import 'package:flutter/material.dart';

import '../../components/custom_text_form_field.dart';
import '../../components/custon_elevated_button.dart';

class LoginPage extends StatelessWidget {
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
              child: Text('로그인 페이지', style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(hint: 'Username'),
          CustomTextFormField(hint: 'Password'),
          CustomElevatedButton(text: '로그인'),
        ],
      ),
    );
  }
}
