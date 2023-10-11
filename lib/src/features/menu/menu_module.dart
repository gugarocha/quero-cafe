import 'package:flutter_modular/flutter_modular.dart';

import 'menu_page.dart';

class MenuModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const MenuPage());
  }
}
