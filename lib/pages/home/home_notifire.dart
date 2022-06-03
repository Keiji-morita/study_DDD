import 'dart:html';

import 'package:ddd/pages/home/states/home.states.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/user/models/user.dart';
import '../app/states/app_notifire.dart';
import '../app/user_notifire.dart';
import '../widgets/dialog/error_dialog.dart';
import 'home_state.dart';
import 'package:uuid/uuid.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.postRepository,
    required this.appNotifier,
    required this.userNotifier,
  }) : super(const HomeState()) {
    userNotifier.fetchUser();
  }

  final PostRepository postRepository;
  final AppNotifier appNotifier;
  final UserNotifier userNotifier;

  final messageController = TextEditingController();
}


Future<void> addPost(User user) async {
    // ???
    final dateId = await Helpers.dateId;
    
    // 言いそびれてましたが、uuidというパッケージを追加しておいてください🙇‍♂️
    final postId = const Uuid().v4();

    if (state.postImageFile != null) {
      final imagePathResult = await postRepository.addPostImageToStorage(
        '/posts/$dateId/$postId',
        state.postImageFile!,
      );

      if (imagePathResult.isError) {
        final context = appNotifier.navigatorKey.currentContext!;

        ErrorDialog('画像が送信できませんでした。インターネットが接続されているかご確認ください。').show(context);
      }

      final imagePath = imagePathResult.asValue!.value;

      state = state.copyWith(postImage: imagePath);
    }

    try {
      await postRepository.addPost(
        dateId: dateId,
        postId: postId,
        user: user,
        content: messageController.text,
        postImage: state.postImage,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> setImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      state = state.copyWith(postImageFile: File(pickedFile.path));
      print(state.postImageFile);
    }
  }
