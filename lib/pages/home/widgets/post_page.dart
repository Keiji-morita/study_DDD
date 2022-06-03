// (lib/pages/home/widgets/post_page.dart)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/user/models/user.dart';
import '../../widgets/text_field/post_text_field.dart';
import '../home_notifire.dart';
// import '../home_state.dart';
import '../states/home.states.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    required this.notifier,
    required this.state,
    required this.user,
  });

  final HomeNotifier notifier;
  final HomeState state;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
	  ),
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.2,
                color: Colors.grey[200],
		//TODO: 選択された画像を表示させる
                child: const SizedBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
	      //TODO: こいつはこの後作ります！
              child: PostTextField(
                hintText: 'message',
                controller: notifier.messageController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  onPrimary: Theme.of(context).primaryColor,
                  textStyle: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'share',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
