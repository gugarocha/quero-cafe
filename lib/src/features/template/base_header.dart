import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/widgets/login_required_dialog.dart';
import '../../store/user/user_store.dart';

class BaseHeader extends StatelessWidget {
  const BaseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final percentHeight = context.percentHeight;

    final isWidthLess420 = screenWidth < 420;
    final isWidthLess550 = screenWidth < 550;

    final userStore = Modular.get<UserStore>();
    final UserStore(:user, :isAuthenticated) = userStore;

    return Container(
      width: screenWidth,
      height: percentHeight(0.15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: ColorsConstants.primary,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              ImagesConstants.logo,
              height: percentHeight(isWidthLess550 ? 0.15 : 0.20),
              width: percentHeight(isWidthLess550 ? 0.15 : 0.20),
              fit: BoxFit.cover,
            ),
          ),
          Visibility(
            visible: isAuthenticated,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Modular.to.navigate('/user/edit');
                },
                child: Text(
                  'Olá, ${user?.name}',
                  style: FontsConstants.textMedium.copyWith(
                    color: ColorsConstants.secondary,
                    fontSize: isWidthLess420 ? 12 : 18,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Modular.to.navigate('/shop/menu');
                  },
                  icon: Icon(
                    Icons.coffee,
                    color: ColorsConstants.secondary,
                    size: isWidthLess420 ? 12 : 18,
                  ),
                  label: Text(
                    'Cardápio',
                    style: FontsConstants.textRegular.copyWith(
                      color: ColorsConstants.secondary,
                      fontSize: isWidthLess420 ? 12 : 18,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    if (isAuthenticated) {
                      Modular.to.navigate('/shop/order');
                      return;
                    }

                    showDialog(
                      context: context,
                      builder: (context) {
                        return const LoginRequiredDialog();
                      },
                    );
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorsConstants.secondary,
                    size: isWidthLess420 ? 12 : 18,
                  ),
                  label: Text(
                    'Meu Pedido',
                    style: FontsConstants.textRegular.copyWith(
                      color: ColorsConstants.secondary,
                      fontSize: isWidthLess420 ? 12 : 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: isWidthLess420 ? 0 : 5,
                ),
                TextButton.icon(
                  onPressed: () async {
                    await userStore.logout();
                    Modular.to.navigate(isAuthenticated ? '/' : '/login');
                  },
                  icon: Icon(
                    user == null ? Icons.login : Icons.logout,
                    color: ColorsConstants.secondary,
                    size: isWidthLess420 ? 12 : 18,
                  ),
                  label: Text(
                    isAuthenticated ? 'Sair' : 'Entrar',
                    style: FontsConstants.textRegular.copyWith(
                      color: ColorsConstants.secondary,
                      fontSize: isWidthLess420 ? 12 : 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
