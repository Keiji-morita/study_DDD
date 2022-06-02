// (lib/pages/app/user_notifier.dart)

import 'package:ddd/pages/app/states/app_notifire.dart';
import 'package:ddd/pages/app/states/user_state.dart';

import '../../domain/user/user_repository.dart';
import '../widgets/dialog/error_dialog.dart';
import 'package:state_notifier/state_notifier.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.repository,
    required this.service,
    required this.appNotifier,
  }) : super(const UserState());

  final UserRepository repository;
  final UserService service;
  final AppNotifier appNotifier;

  /// ユーザーの認証状態を確認(シンプル過ぎますがここはいろんな方法があるので今回は最低限にしています笑)
  void listenAuthStatus() {
    final result = service.userId;

    if (result == null) {
      state = state.copyWith(userStatus: UserStatus.none);
      return;
    }

    state = state.copyWith(userStatus: UserStatus.email);
  }

  /// ユーザー情報を取得
  Future<void> fetchUser() async {
    final uid = service.userId;

    if (uid == null) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('ユーザー情報取得時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);

      return;
    }

    final userResult = await repository.fetchUser(uid);

    if (userResult.isError) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('ユーザー情報取得時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);

      return;
    }

    final user = userResult.asValue!.value;

    state = state.copyWith(user: user);
  }
}
