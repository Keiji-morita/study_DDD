// (lib/widgets/dialog/dialog_base.dart)

//　この抽象クラスを使って色々なDialogを派生して作成していきます！
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DialogBase<T> {
  const DialogBase();

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: title(context) == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(8),
              child: title(context),
            ),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: content(context),
      ),
      actions: actions(context),
    );
  }

  Future<T?> show(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (context) => _dialog(context),
    );
  }

  Widget? title(BuildContext context);

  Widget content(BuildContext context);

  List<Widget> actions(BuildContext context);
}