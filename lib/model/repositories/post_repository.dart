import 'package:post_app/model/dataSources/LocalDataSources.dart';

import '../models/post.dart';

class PostRepository {
  final LocalDataSources _localDataSources = LocalDataSources();

  PostRepository({
    required LocalDataSources dataSources,
});

  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _localDataSources.posts;
  }

  Future<void> createPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    _localDataSources.posts.add(post);
  }

  Future<void> updatePost(Post updatedPost) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _localDataSources.posts.indexWhere((post) => post.id == updatedPost.id);
    if (index != -1) {
      _localDataSources.posts[index] = updatedPost;
    } else {
      print("Post not found for update");
    }
  }

}
