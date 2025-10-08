import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body){
  String responseBody = jsonEncode(body); // json 데이터로 변경
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}
// json 인코드 하는 이유?
// 응답으로 받은 바디는 코드유닛이 바로 사용되지 않음
// 응답으로 받은 바디를 dynamic으로 받아서 그걸 json 타입으로 바꿔서 인코딩 하고, 다시 디코딩해야함