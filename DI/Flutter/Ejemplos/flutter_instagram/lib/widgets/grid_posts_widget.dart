import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram/bloc/user_posts/user_posts_bloc.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/repository/post_repository/post_repository_impl.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';
import 'package:flutter_instagram/widgets/shimmer_posts_widget.dart';
import 'package:flutter_instagram/widgets/single_grid_post_view.dart';
import '../repository/post_repository/post_repository.dart';
import 'error_widget.dart';

class CardGridPost extends StatefulWidget {
  const CardGridPost({Key? key}) : super(key: key);

  @override
  _CardGridPostState createState() => _CardGridPostState();
}

class _CardGridPostState extends State<CardGridPost> {
  late PostRepository postRepository;
  late UserPostsBloc _postByUsernameBloc;
  String username = PreferenceUtils.getString('USERNAME')!;

  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
    postRepository = PostRepositoryImpl();
    _postByUsernameBloc = UserPostsBloc(postRepository)
      ..add(FetchPostWithUsername(username));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _postByUsernameBloc),
        ],
        child: Scaffold(
            body: RefreshIndicator(
                onRefresh: () async {
                  _postByUsernameBloc.add(FetchPostWithUsername(username));
                },
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: _createBody(context)))));
  }

  Widget _createBody(BuildContext context) {
    return BlocBuilder<UserPostsBloc, UserPostsState>(
      bloc: _postByUsernameBloc,
      builder: (context, state) {
        if (state is UserPostsInitial) {
          return Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ShimmerPostsList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ShimmerPostsList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ShimmerPostsList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ShimmerPostsList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ShimmerPostsList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ShimmerPostsList(),
              ),
            ],
          );
        } else if (state is PostByUsernameFetchError) {
          return ErrorScreen(
            message: state.message,
            retry: () {
              context
                  .watch<UserPostsBloc>()
                  .add(FetchPostWithUsername(username));
            },
          );
        } else if (state is PostsByUsernameFetched) {
          return _createPostsView(context, state.posts);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget _createPostsView(BuildContext context, List<PostResponse> posts) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 2,
            ),
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              int reverseIndex = posts.length - 1 - index;
              return SingleGridPost(post: posts[reverseIndex]);
            },
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.vertical,
          ),
        ),
      ],
    );
  }
}
