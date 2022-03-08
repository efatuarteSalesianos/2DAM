import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/repository/post_repository/post_repository.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostsInitial()) {
    on<FetchPostWithType>(_postsFetched);
  }

  void _postsFetched(FetchPostWithType event, Emitter<PostsState> emit) async {
    try {
      final posts = await postRepository.fetchPosts(event.type);
      emit(PostsFetched(posts, event.type));
      return;
    } on Exception catch (e) {
      emit(PostFetchError(e.toString()));
    }
  }
}
