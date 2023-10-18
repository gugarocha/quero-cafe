import 'package:flutter_modular/flutter_modular.dart';

import 'features/core_module.dart';
import 'features/home/home_page.dart';
import 'features/login/login_module.dart';
import 'features/menu/menu_module.dart';
import 'features/order/order_module.dart';
import 'features/payment/payment_module.dart';
import 'features/signup/signup_module.dart';
import 'features/template/base_layout.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.module('/login', module: LoginModule());
    r.module('/signup', module: SignupModule());
    r.child(
      '/shop',
      child: (_) => const BaseLayout(
        body: RouterOutlet(),
      ),
      children: [
        ModuleRoute('/menu', module: MenuModule()),
        ModuleRoute('/order', module: OrderModule()),
        ModuleRoute('/payment', module: PaymentModule()),
      ],
    );
  }
}
