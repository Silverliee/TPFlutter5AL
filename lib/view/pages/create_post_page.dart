import 'package:flutter/material.dart';
import 'package:post_app/model/models/post.dart';
import 'package:post_app/model/repositories/post_repository.dart';

class CreatePostPage extends StatelessWidget {
  final PostRepository postRepository;

  const CreatePostPage({super.key, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Créer un nouveau post')),
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
                final newPost = Post(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  description: descriptionController.text,
                );

                postRepository.createPost(newPost).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }
}
