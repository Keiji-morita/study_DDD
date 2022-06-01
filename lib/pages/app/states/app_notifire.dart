
import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState());

  final navigatorKey = GlobalKey<NavigatorState>();

}
