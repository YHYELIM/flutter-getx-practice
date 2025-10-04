import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final String? value;

  const CustomTextArea({required this.hint, required this.funValidator, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 10,
        initialValue: value ?? "",
        validator: funValidator,
        obscureText: hint=='Password'?true:false,
        decoration: InputDecoration(
          hintText: "Enter ${hint}", // 변수 넣을때 문자열 안에 넣는게 좋다 -> null 안정성
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
