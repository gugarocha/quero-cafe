import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/order/order_repository.dart';
import '../../repositories/order/order_repository_impl.dart';
import '../auth_guard.dart';
import '../core_module.dart';
import 'payment_controller.dart';
import 'payment_page.dart';

class PaymentModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<OrderRepository>(OrderRepositoryImpl.new);
    i.addLazySingleton(PaymentController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const PaymentPage(),
      guards: [AuthGuard()],
    );
  }
}
