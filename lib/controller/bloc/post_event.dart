import 'package:post_app/model/models/post.dart';

abstract class PostEvent {}

class FetchPosts extends PostEvent {}

class CreatePost extends PostEvent {
  final Post post;

  CreatePost(this.post);
}

class UpdatePost extends PostEvent {
  final Post post;

  UpdatePost(this.post);
}