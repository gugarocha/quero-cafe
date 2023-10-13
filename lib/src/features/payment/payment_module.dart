import 'package:flutter_modular/flutter_modular.dart';

import 'payment_page.dart';

class PaymentModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const PaymentPage());
  }
}
