// (lib/pages/app/post_notifier.dart)

import 'package:ddd/pages/app/states/app_notifire.dart';

import '../../domain/error/post_error.dart';
import '../../domain/post/post_repository.dart';
import '../../domain/post/states/post_list.dart';
import '../widgets/dialog/error_dialog.dart';

class PostNotifier extends StateNotifier<PostList> {
  PostNotifier({
    required this.postRepository,
    required this.appNotifier,
  }) : super(const PostList()) {
    fetchPost();
  }

  final AppNotifier appNotifier;
  final PostRepository postRepository;

  Future<void> fetchPost() async {
    final allPostsResult = await postRepository.fetchPost(
      dateId: await Helpers.dateId,
    );

    if (allPostsResult.isError) {
      switch (allPostsResult.asError!.error) {
        case PostError.error:
          final context = appNotifier.navigatorKey.currentContext!;
          ErrorDialog('投稿の取得に失敗しました').show(context);
          break;

        case PostError.noData:
          break;

        default:
      }

      return;
    }

    final allPosts = allPostsResult.asValue!.value;

    state = state.copyWith(postList: allPosts);
  }
}
