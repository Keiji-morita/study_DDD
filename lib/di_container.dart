// (lib/di_container.dart)

import 'package:ddd/pages/app/states/app_notifire.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'domain/user/user_repository.dart';

List<SingleChildWidget> get domainProviders {
  return <SingleChildWidget>[
    Provider<UserRepository>(
      create: (_) => UserRepository(),
    ),
    Provider<UserService>(
      create: (_) => UserService(),
    ),
  ];
}

List<SingleChildWidget> get notifierProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<AppNotifier, AppState>(
      create: (_) => AppNotifier(),
    ),
  ];
}
