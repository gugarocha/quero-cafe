import 'package:flutter_modular/flutter_modular.dart';

import '../repositories/auth/auth_repository.dart';
import '../repositories/auth/auth_repository_impl.dart';
import '../services/firebase_service.dart';
import '../store/cart/cart_store.dart';
import '../store/user/user_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(FirebaseService.new);
    i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.addLazySingleton(UserStore.new);
    i.addLazySingleton(CartStore.new);
  }
}
