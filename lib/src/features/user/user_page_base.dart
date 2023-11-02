import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';

class UserPageBase extends StatelessWidget {
  final String pageName;
  final VoidCallback onSavePress;
  final Widget child;

  const UserPageBase({
    super.key,
    required this.pageName,
    required this.onSavePress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isWidthLess400 = screenWidth < 400;

    return SingleChildScrollView(
      child: Column(
        children: [
          FittedBox(
            child: Text(
              pageName,
              style: FontsConstants.textTitle,
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 550,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                child,
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 6,
                      child: TextButton(
                        onPressed: () {
                          Modular.to.navigate('/shop/menu');
                        },
                        child: FittedBox(
                          child: Text(
                            'Cancelar',
                            style: FontsConstants.textRegular.copyWith(
                              color: ColorsConstants.primary,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      flex: 6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(
                            isWidthLess400 ? 50 : 70,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              isWidthLess400 ? 10 : 20,
                            ),
                          ),
                        ),
                        onPressed: onSavePress,
                        child: const FittedBox(
                          child: Text('Salvar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
