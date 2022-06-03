// (lib/widgets/text_field/post_text_field.dart)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTextField extends StatelessWidget {
  const PostTextField({
    required this.controller,
    this.hintText = 'Please write something!',
  });

  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}