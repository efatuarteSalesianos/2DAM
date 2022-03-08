part of 'user_posts_bloc.dart';

abstract class UserPostsState extends Equatable {
  const UserPostsState();

  @override
  List<Object> get props => [];
}

class UserPostsInitial extends UserPostsState {}

class PostsByUsernameFetched extends UserPostsState {
  final List<PostResponse> posts;
  final String username;

  const PostsByUsernameFetched(this.posts, this.username);

  @override
  List<Object> get props => [posts, username];
}

class PostByUsernameFetchError extends UserPostsState {
  final String message;
  const PostByUsernameFetchError(this.message);

  @override
  List<Object> get props => [message];
}
