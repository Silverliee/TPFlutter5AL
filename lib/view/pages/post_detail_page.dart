import 'package:flutter/material.dart';
import 'package:post_app/model/repositories/post_repository.dart';
import '../../model/models/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  final PostRepository postRepository;

  const PostDetailPage({super.key, required this.post, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: post.title);
    final descriptionController = TextEditingController(text: post.description);

    return Scaffold(
      appBar: AppBar(title: const Text('Détails du post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final updatedPost = post.copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                );

                postRepository.updatePost(updatedPost).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Mettre à jour'),
            ),
          ],
        ),
      ),
    );
  }
}
