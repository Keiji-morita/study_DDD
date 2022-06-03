// (lib/domain/post/states/post.dart)
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/models/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default('') String id,
    @Default('') String title,
    @Default('') String content,
    @Default('') String postImage,
    User? user,
  }) = _Post;

  const Post._();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}