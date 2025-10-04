import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_todo_app/getx_blog/view/components/custom_text_area.dart';
import 'package:getx_todo_app/getx_blog/view/components/custon_elevated_button.dart';
import 'package:getx_todo_app/getx_blog/util/validator_util.dart';

import '../../components/custom_text_form_field.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funValidator: validateTitle(),
                value: "제목1" * 2,
              ),
              CustomTextArea(hint: "Area", funValidator: validateContents(),
                value: "내용1" * 20,
              ),
              CustomElevatedButton(
                text: "글 수정하기",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back(); // 상태관리 GetX 라이브러리 -Obs
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
