part of 'user_posts_bloc.dart';

abstract class UserPostsEvent extends Equatable {
  const UserPostsEvent();

  @override
  List<Object> get props => [];
}

class FetchPostWithUsername extends UserPostsEvent {
  final String username;

  const FetchPostWithUsername(this.username);

  @override
  List<Object> get props => [username];
}
