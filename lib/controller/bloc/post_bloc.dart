import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/controller/bloc/post_event.dart';
import 'package:post_app/controller/bloc/post_state.dart';
import 'package:post_app/model/repositories/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<CreatePost>(_onCreatePost);
    on<UpdatePost>(_onUpdatePost);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await postRepository.fetchPosts();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

  void _onCreatePost(CreatePost event, Emitter<PostState> emit) async {
    try {
      await postRepository.createPost(event.post);
      add(FetchPosts());
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

  void _onUpdatePost(UpdatePost event, Emitter<PostState> emit) async {
    try {
      await postRepository.updatePost(event.post);
      add(FetchPosts());
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}