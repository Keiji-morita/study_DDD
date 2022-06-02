// (lib/pages/app/states/user_state.dart)
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

// ユーザーのログイン状態をenum型で管理します。
enum UserStatus {
  none,
  error,
  success,
  waiting,
  email,
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserStatus.waiting) UserStatus userStatus,
    @Default(User()) User user,
  }) = _UserState;

  UserState copyWith({required user}) {}
}
