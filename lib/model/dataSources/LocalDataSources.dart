import 'package:post_app/model/models/post.dart';

class LocalDataSources {
  final List<Post> posts = [
    Post(id: 1, title: "Post 1", description: 'Description 1'),
    Post(id: 2, title: "Post 2", description: "Description 2"),
    Post(id: 3, title: "Post 3", description: "Description 3"),
  ];
}