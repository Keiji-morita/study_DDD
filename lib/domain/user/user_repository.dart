// (lib/domain/user/user_repository.dart)
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService {
  final _auth = FirebaseAuth.instance;

  String? get userId => _auth.currentUser?.uid ?? null;

  Future<Result<String>> signUpEmail({
    required String email,
    required String password,
  }) async {
    late final UserCredential user;

    try {
    // 例外処理内は必要最小限に抑えること！
      user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      print(e);
      // Result型でエラーの中身を返す。
      return Result.error(e);
    }
    // result型で値を返す。
    return Result.value(user.user!.uid);
  }
}

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<Result<bool>> addUser({
    required String uid,
    required String name,
  }) async {
    final doc = _db.doc('/private/users/$uid/writeOnly/');

    try {
      doc.set(
        {
          'userId': uid,
          'name': name,
        },
	// mergeをtrueにすることで上書き削除を防ぐ
        SetOptions(merge: true),
      );
    } catch (e) {
      return Result.error(e);
    }

    return Result.value(true);
  }
}