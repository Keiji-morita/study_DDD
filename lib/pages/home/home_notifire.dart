import 'package:flutter/cupertino.dart';

import '../app/states/app_notifire.dart';
import '../app/user_notifire.dart';
import 'home_state.dart';

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