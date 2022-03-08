import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/repository/post_repository/post_repository.dart';

part 'user_posts_event.dart';
part 'user_posts_state.dart';

class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  final PostRepository postRepository;

  UserPostsBloc(this.postRepository) : super(UserPostsInitial()) {
    on<FetchPostWithUsername>(_postsByUsernameFetched);
  }

  void _postsByUsernameFetched(
      FetchPostWithUsername event, Emitter<UserPostsState> emit) async {
    try {
      final posts = await postRepository.fetchPostsByUser(event.username);
      emit(PostsByUsernameFetched(posts, event.username));
      return;
    } on Exception catch (e) {
      emit(PostByUsernameFetchError(e.toString()));
    }
  }
}
