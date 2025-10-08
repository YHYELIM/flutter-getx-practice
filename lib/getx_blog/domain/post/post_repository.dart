import 'dart:async';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:getx_todo_app/getx_blog/controller/dto/CMRespDto.dart';
import 'package:getx_todo_app/getx_blog/controller/dto/LoginReqDto.dart';
import 'package:getx_todo_app/getx_blog/controller/dto/UpdateReqDto.dart';
import 'package:getx_todo_app/getx_blog/domain/post/post.dart';
import 'package:getx_todo_app/getx_blog/domain/post/post_provider.dart';
import 'package:getx_todo_app/getx_blog/domain/user/user_provider.dart';
import 'package:getx_todo_app/getx_blog/util/convert_utf8.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> updateById (int id, String title, String content)async{
    Updatereqdto updatereqdto = Updatereqdto(title, content);
    Response response = await _postProvider.updateById(id, updatereqdto.toJson());
    dynamic body = response.body;
    Cmrespdto cmrespdto = Cmrespdto.fromJson(body);
    if(cmrespdto.code == 1){
      Post post = Post.fromJson(cmrespdto.data);
      return post;
    } else{
      print("수정 실패");
      return Post();
    }
  }


  Future<int> deleteById (int id)async{
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    Cmrespdto cmrespdto = Cmrespdto.fromJson(body);

    return cmrespdto.code!;

  }

  Future <Post> findById(int id)async{
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    Cmrespdto cmrespdto = Cmrespdto.fromJson(body);

    if(cmrespdto.code == 1){
      Post post = Post.fromJson(cmrespdto.data); // 한건이니까 List로 바꿀 필요 없음
      return post;
    } else{
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    Cmrespdto cmrespdto = Cmrespdto.fromJson(body);
    // print(cmrespdto.code);
    // print(cmrespdto.msg);
    // print(cmrespdto.data);
    // print(cmrespdto.data.runtimeType);// 런타임시 타입을 알 수 있음

    // 응답 타입 : List<dynamic>
    // 응답 성공시 List<Post> 타입으로 바꿔준다
    if(cmrespdto.code == 1){
      List<dynamic> temp = cmrespdto.data; // 런타임시 타입을 알 수 있기때문에 임시로 저장해줌
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[];
    }
  }
}
