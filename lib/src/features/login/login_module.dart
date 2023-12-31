import 'package:flutter_modular/flutter_modular.dart';

import '../core_module.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
