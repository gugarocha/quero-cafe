import 'package:flutter_modular/flutter_modular.dart';

import '../core_module.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/auth_repository_impl.dart';
import 'payment_page.dart';

class PaymentModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const PaymentPage());
  }
}
