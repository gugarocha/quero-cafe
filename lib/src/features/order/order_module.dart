import 'package:flutter_modular/flutter_modular.dart';

import 'order_page.dart';

class OrderModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const OrderPage());
  }
}
