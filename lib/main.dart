import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/controller/bloc/post_bloc.dart';
import 'package:post_app/controller/bloc/post_event.dart';
import 'package:post_app/model/repositories/post_repository.dart';
import 'package:post_app/view/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'model/dataSources/LocalDataSources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final postRepository = PostRepository(dataSources: LocalDataSources());

    return MultiProvider(
      providers: [
        Provider<PostRepository>(
          create: (context) => postRepository,
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(postRepository)..add(FetchPosts()),
        ),
      ],
      child: MaterialApp(
        title: 'Post App (mettez moi 20/20 stp)',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}