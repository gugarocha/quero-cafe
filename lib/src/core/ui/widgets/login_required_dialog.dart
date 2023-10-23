import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants.dart';
import '../helpers/size_extensions.dart';

class LoginRequiredDialog extends StatelessWidget {
  const LoginRequiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isWidthLess420 = screenWidth < 420;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login Necessário',
                  style: FontsConstants.textMedium.copyWith(
                    fontSize: isWidthLess420 ? 26 : 32,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Para adicionar produtos ao seu carrinho e concluir o pedido é necessário que você esteja logado em nossa loja!',
                  textAlign: TextAlign.center,
                  style: FontsConstants.textRegular.copyWith(
                    fontSize: isWidthLess420 ? 18 : 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: FontsConstants.textMedium.copyWith(
                              fontSize: isWidthLess420 ? 18 : 24,
                            ),
                            ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Modular.to.navigate('/login');
                        },
                        child: const FittedBox(
                          child: Text('Login'),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 3,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          textStyle: FontsConstants.textMedium.copyWith(
                            fontSize: isWidthLess420 ? 18 : 24,
                            color: ColorsConstants.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const FittedBox(
                          child: Text('Cancelar'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
