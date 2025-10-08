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

  void findAll() async {
    List<Post> posts = await _postRepository.findAll();
    // 통신 끝나면 여기에 담김
    this.posts.value = posts;
  }

  Future <void> findById(int id) async{
    Post post = await _postRepository.findById(id);
    print("받아온 post 데이터: title=${post.title}, content=${post.content}");
    this.post.value = post;
  }
}