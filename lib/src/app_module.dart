import 'package:flutter_modular/flutter_modular.dart';

import 'features/home/home_page.dart';
import 'features/login/login_module.dart';
import 'features/menu/menu_module.dart';
import 'features/order/order_module.dart';
import 'features/signup/signup_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.module('/login', module: LoginModule());
    r.module('/signup', module: SignupModule());
    r.module('/menu', module: MenuModule());
    r.module('/order', module: OrderModule());
  }
}
