import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final funValidator;

  const CustomTextFormField({required this.hint, required this.funValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        // 함수를 외부에서 받아야함 -> validation 체크해야할 값들이 다르기때문
        validator: funValidator,
        obscureText: hint=='Password'?true:false,
        decoration: InputDecoration(
          hintText: "Enter ${hint}", // 변수 넣을때 문자열 안에 넣는게 좋다 -> null 안정성
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
