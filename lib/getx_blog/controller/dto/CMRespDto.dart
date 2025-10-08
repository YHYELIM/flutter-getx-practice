import 'package:intl/intl.dart';

class Cmrespdto{
  final int? code;
  final String? msg;
  final dynamic data;

  Cmrespdto({this.code, this.msg, this.data, });


  Cmrespdto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"]; // 여기 data는 응답에 따라 다르게 동적으로 담길거임

}
