import 'package:flutter_modular/flutter_modular.dart';

import '../auth_guard.dart';
import '../core_module.dart';
import 'order_page.dart';

class OrderModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const OrderPage(),
      guards: [AuthGuard()],
    );
  }
}
