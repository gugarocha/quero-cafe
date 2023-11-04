import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../core_module.dart';
import 'change_password/change_password._page.dart';
import 'change_password/change_password_controller.dart';
import 'edit/user_edit_controller.dart';
import 'edit/user_edit_page.dart';

class UserModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    i.addLazySingleton(UserEditController.new);
    i.addLazySingleton(ChangePasswordController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/edit', child: (_) => const UserEditPage());
    r.child('/password', child: (_) => const ChangePasswordPage());
  }
}
