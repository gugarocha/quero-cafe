import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/products/products_repository.dart';
import '../../repositories/products/products_repository_impl.dart';
import '../core_module.dart';
import 'menu_page.dart';
import 'products_controller.dart';

class MenuModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<ProductsRepository>(ProductsRepositoryImpl.new);
    i.addLazySingleton(ProductsController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const MenuPage());
  }
}
