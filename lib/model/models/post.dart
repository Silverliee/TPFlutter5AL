import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String description;

  const Post(
      {required this.id, required this.title, required this.description});

  @override
  List<Object?> get props => [id, title, description];

  copyWith({required String title, required String description})
    => Post(id: id, title: title, description: description);
}
