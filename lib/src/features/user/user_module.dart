import 'package:flutter_modular/flutter_modular.dart';

import '../core_module.dart';
import 'change_password/change_password._page.dart';
import 'edit/user_edit_page.dart';

class UserModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/edit', child: (_) => const UserEditPage());
    r.child('/password', child: (_) => const ChangePasswordPage());
  }
}
