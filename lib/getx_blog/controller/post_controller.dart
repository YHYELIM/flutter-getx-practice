import 'package:get/get.dart';
import 'package:getx_todo_app/getx_blog/domain/post/post_repository.dart';

import '../domain/post/post.dart';

class PostController extends GetxController {

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;


  @override
  void onInit() {
    super.onInit();
    findAll(); // 초기에 findAll() 호출
  }

  Future<void> updateById(int id, String title, String content) async{
    Post post = await _postRepository.updateById(id, title, content);
    if(post.id != null){
      this.post.value = post;
      // posts를 순회하면서 post의 id와 id가 같으면
      // ...e의 값을 ...post로 변경하고 아니면 ...e 반환
     this.posts.value = this.posts.map((e) => e.id == id ? post : e).toList();
    }
  }

  Future<void> deleteById(int id) async{
    int result = await _postRepository.deleteById(id);
    if (result == 1){
      print("서버쪽 삭제 성공");
      List<Post> result = posts.value.where((post) => post.id != id).toList();
      // print(result.length);
      // deleteById에서 받은 id와 post id가 같지 않은 것만 result에 담음
      posts.value = result;

    }
    // posts 데이터를 갱신해줘야함
}
  void findAll() async {
    List<Post> posts = await _postRepository.findAll();
    // 통신 끝나면 여기에 담김
    this.posts.value = posts;
  }

  Future <void> findById(int id) async{
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }
}