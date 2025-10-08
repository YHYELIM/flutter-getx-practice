import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_todo_app/getx_blog/controller/post_controller.dart';
import 'package:getx_todo_app/getx_blog/view/components/custom_text_area.dart';
import 'package:getx_todo_app/getx_blog/view/components/custon_elevated_button.dart';
import 'package:getx_todo_app/getx_blog/util/validator_util.dart';

import '../../components/custom_text_form_field.dart';

class UpdatePage extends StatelessWidget {



  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
    _title.text = "${p.post.value.title}";
    _content.text = "${p.post.value.content}";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: _title,
                hint: "Title",
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                controller: _content,
                hint: "Area",
                funValidator: validateContents(),
              ),
              CustomElevatedButton(
                text: "글 수정하기",
                funPageRoute: () {
                  if (_formKey.currentState!.validate())  {
                    p.updateById(p.post.value.id ?? 0, _title.text, _content.text);
                    Get.back(); // 상태관리 GetX 라이브러리 -Obs
                    // 이전 상태 페이지로 돌아가는데 update가 반영되는 이유?
                    // -> detailPage에서 obx로 관찰을 하고 있으므로 반영이 됨
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
