import 'package:flutter/material.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/widgets/set_amount_button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isWidthLess400 = screenWidth < 400;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: isWidthLess400 ? 45 : 60,
          child: const FittedBox(
            child: SetAmountButton(),
          ),
        ),
        SizedBox(width: isWidthLess400 ? 8 : 15),
        Expanded(
          child: Text(
            'Nome do Produto',
            style: FontsConstants.textRegular.copyWith(
              fontSize: isWidthLess400 ? 14 : 24,
            ),
          ),
        ),
        SizedBox(width: isWidthLess400 ? 8 : 15),
        Text(
          'R\$ 10,00',
          style: FontsConstants.textRegular.copyWith(
            fontSize: isWidthLess400 ? 14 : 24,
          ),
        ),
      ],
    );
  }
}
