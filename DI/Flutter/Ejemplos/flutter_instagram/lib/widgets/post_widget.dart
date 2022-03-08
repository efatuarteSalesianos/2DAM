import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram/bloc/posts/posts_bloc.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/repository/constants.dart';
import 'package:flutter_instagram/repository/post_repository/post_repository.dart';
import 'package:flutter_instagram/repository/post_repository/post_repository_impl.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';
import 'package:flutter_instagram/widgets/error_widget.dart';
import 'package:flutter_instagram/widgets/shimmer_posts_widget.dart';
import 'package:flutter_instagram/widgets/single_post_view.dart';

class CardPost extends StatefulWidget {
  const CardPost({Key? key}) : super(key: key);

  @override
  _CardPostState createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  late PostRepository postRepository;
  late PostBloc _publicPostBloc;

  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
    postRepository = PostRepositoryImpl();
    _publicPostBloc = PostBloc(postRepository)
      ..add(FetchPostWithType(Constant.public));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _publicPostBloc),
        ],
        child: RefreshIndicator(
            onRefresh: () async {
              _publicPostBloc.add(FetchPostWithType(Constant.public));
            },
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.64,
                    child: _createBody(context)))));
  }

  Widget _createBody(BuildContext context) {
    return BlocBuilder<PostBloc, PostsState>(
      bloc: _publicPostBloc,
      builder: (context, state) {
        if (state is PostsInitial) {
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
        } else if (state is PostFetchError) {
          return ErrorScreen(
            message: state.message,
            retry: () {
              context.watch<PostBloc>().add(FetchPostWithType(Constant.public));
            },
          );
        } else if (state is PostsFetched) {
          return _createPostsView(context, state.posts);
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget _createPostsView(BuildContext context, List<PostResponse> posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        int reverseIndex = posts.length - 1 - index;
        return SinglePost(post: posts[reverseIndex]);
      },
      padding: const EdgeInsets.symmetric(vertical: 5),
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
    );
  }
}
