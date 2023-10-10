import 'package:flutter_modular/flutter_modular.dart';

import 'features/home/home_page.dart';
import 'features/login/login_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.module('/login', module: LoginModule());
  }
}
