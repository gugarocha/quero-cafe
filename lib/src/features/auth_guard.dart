import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../store/user/user_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<UserStore>().isAuthenticated;
  }
}
