// (lib/domain/post/states/post_list.dart)
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list.freezed.dart';

@freezed
class PostList with _$PostList {
  const factory PostList({
    @Default(<Post>[]) List<Post> postList,
  }) = _PostList;

  const PostList._();
}