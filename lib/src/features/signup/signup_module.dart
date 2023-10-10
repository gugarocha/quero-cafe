import 'package:flutter_modular/flutter_modular.dart';

import 'signup_page.dart';

class SignupModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SignupPage());
  }
}
