// (lib/pages/home/home_page.dart)

// import 'package:ddd/pages/home/home_state.dart';
import 'package:ddd/pages/home/states/home.states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../app/states/user_state.dart';
import 'home_notifire.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomeNotifier, HomeState>(
          create: (context) => HomeNotifier(
            postRepository: context.read<PostRepository>(),
            appNotifier: context.read<AppNotifier>(),
            userNotifier: context.read<UserNotifier>(),
          ),
          child: const HomePage._(),
        ),
      ],
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<HomeNotifier>();
    final user = context.select((UserState value) => value).user;
    final state = context.watch<HomeState>();

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
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            //TODO: 投稿画面に遷移するようにする
          },
        ),
        backgroundColor: Colors.white,
      ),
      // 投稿を表示
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
	//TODO: 投稿のUIを作成。
          return const SizedBox();
        },
      ),
    );
  }
}