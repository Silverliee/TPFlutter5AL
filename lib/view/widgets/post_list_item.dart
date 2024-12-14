import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/controller/bloc/post_bloc.dart';
import 'package:post_app/model/models/post.dart';
import 'package:post_app/model/repositories/post_repository.dart';

import '../../controller/bloc/post_event.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final PostRepository postRepository;

  const PostListItem(
      {super.key, required this.post, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(post.description),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            _showUpdateDialog(context, post);
          },
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, Post post) {
    final titleController = TextEditingController(text: post.title);
    final descriptionController = TextEditingController(text: post.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedPost = post.copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                context.read<PostBloc>().add(UpdatePost(updatedPost));
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
