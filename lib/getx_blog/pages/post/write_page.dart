import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_todo_app/getx_blog/components/custom_text_area.dart';
import 'package:getx_todo_app/getx_blog/components/custom_text_form_field.dart';
import 'package:getx_todo_app/getx_blog/components/custon_elevated_button.dart';
import 'package:getx_todo_app/getx_blog/pages/post/home_page.dart';
import 'package:getx_todo_app/getx_blog/util/validator_util.dart';

class WritePage extends StatelessWidget {
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
              ),
              CustomTextArea(hint: "Area", funValidator: validateContents()),
              CustomElevatedButton(text: "글쓰기", funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(HomePage());
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
