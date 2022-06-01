// (lib/pages/sign_in/sign_in_notifier.dart)


import 'dart:html';

import 'package:ddd/pages/sign_in/states/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '../../domain/user/user_repository.dart';


class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required this.repository,
    required this.service,
  }) : super(const SignInState());

  final UserService service;
  final UserRepository repository;

  late final nameController = TextEditingController();
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
  late final bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void selectProfileImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      state = state.copyWith(userImageFile: File(pickedFile.path));
    }
  }

  Future<UserStatus> addUser(String name, String email, String password) async {
    final result = await service.signUpEmail(
      email: email,
      password: password,
    );

    if (result.isError) {
      return UserStatus.error;
    }

    final uid = service.userId;

    if (uid == null) {
      
      return UserStatus.none;
    }

    final addUserResult = await repository.addUser(uid: uid, name: name);

    if (addUserResult.isError) {
      return UserStatus.error;
    }

    return UserStatus.success;
  }

  Future<void> addUserInfo(
    File? userImageFile,
    String? message,
  ) async {
    final uid = service.userId;

    if (uid == null) {
      return;
    }

    String? userImage;

    if (userImageFile != null) {
      userImage = await saveUserImage(userImageFile, uid);
    }

    final addUserResult = await repository.addUserInfo(
      uid: uid,
      message: message,
      userImage: userImage,
    );

    if (addUserResult.isError) {
      return;
    }

    await repository.fetchUser(uid);
  }

  Future<String> saveUserImage(File file, String uid) async {
    final path = '/users/$uid';

    final result = await repository.addUserImageToStorage(path, file);

    if (result.isError) {
      return '';
    }

    return result.asValue!.value;
  }
}
