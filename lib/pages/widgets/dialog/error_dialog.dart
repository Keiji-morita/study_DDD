// DialogBaseというクラスを継承して使います。
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_dialog.dart';

class ErrorDialog extends DialogBase<void> {
  const ErrorDialog(this.message) : super();

  final String message;

  @override
  Widget? title(BuildContext context) {
    return Text(
      'エラー',
      style: TextStyle(color: Colors.red[600]),
    );
  }

  @override
  Widget content(BuildContext context) {
    return Text(message);
  }

  @override
  List<Widget> actions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(
          '閉じる',
          style: TextStyle(color: Colors.black),
        ),
      )
    ];
  }
}