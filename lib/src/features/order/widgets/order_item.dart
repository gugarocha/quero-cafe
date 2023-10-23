import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/formatter_extensions.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/widgets/set_amount_button.dart';
import '../../../store/cart/cart_item.dart';
import '../../../store/cart/cart_store.dart';

class OrderItem extends StatelessWidget {
  final CartItem cartItem;

  const OrderItem(this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isWidthLess400 = screenWidth < 400;

    final cartStore = Modular.get<CartStore>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: isWidthLess400 ? 45 : 60,
          child: FittedBox(
            child: Observer(
              builder: (context) {
                return SetAmountButton(
                  amount: cartItem.amount,
                  incrementButton: () {
                    cartStore.updateCartItemAmount(cartItem.product, 1);
                  },
                  decrementButton: () {
                    if (cartItem.amount >= 1) {
                      cartStore.updateCartItemAmount(cartItem.product, -1);
                    }
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(width: isWidthLess400 ? 8 : 15),
        Expanded(
          child: Text(
            cartItem.product.name,
            style: FontsConstants.textRegular.copyWith(
              fontSize: isWidthLess400 ? 14 : 24,
            ),
          ),
        ),
        SizedBox(width: isWidthLess400 ? 8 : 15),
        Observer(
          builder: (context) {
            return Text(
              cartItem.getItemTotal.currencyPTBR,
              style: FontsConstants.textRegular.copyWith(
                fontSize: isWidthLess400 ? 14 : 24,
              ),
            );
          },
        ),
      ],
    );
  }
}
