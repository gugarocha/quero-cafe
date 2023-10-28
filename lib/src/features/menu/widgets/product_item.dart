import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/formatter_extensions.dart';
import '../../../core/ui/widgets/set_amount_button.dart';
import '../../../models/product_model.dart';
import '../../../store/cart/cart_store.dart';
import '../../../store/user/user_store.dart';
import '../../../core/ui/widgets/login_required_dialog.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  const ProductItem(this.product, {super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    final UserStore(:isAuthenticated) = Modular.get<UserStore>();
    final cartStore = Modular.get<CartStore>();

    void onIncrement() {
      setState(() => amount++);
    }

    void onDecrement() {
      if (amount > 1) {
        setState(() => amount--);
      }
    }

    void onAddToCartPressed() {
      if (!isAuthenticated) {
        showDialog(
          context: context,
          builder: (context) => const LoginRequiredDialog(),
        );
        return;
      }
      cartStore.alredyInCart(widget.product)
          ? cartStore.updateCartItemAmount(widget.product, amount)
          : cartStore.addToCart(widget.product, amount);

      setState(() => amount = 1);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidthLess310 = constraints.maxWidth < 310;

        return Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: FadeInImage.assetNetwork(
                image: widget.product.imageUrl,
                placeholder: ImagesConstants.productLoading,
                width: 420,
                height: constraints.maxWidth * 0.66,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: maxWidthLess310 ? 5 : 15,
                  horizontal: maxWidthLess310 ? 10 : 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        widget.product.name,
                        style: FontsConstants.textSemiBold.copyWith(
                          fontSize: maxWidthLess310 ? 20 : 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: maxWidthLess310 ? 2 : 5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          widget.product.description,
                          style:
                              FontsConstants.textLight.copyWith(fontSize: 16),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: maxWidthLess310 ? 2 : 5,
                      ),
                      child: Text(
                        widget.product.price.currencyPTBR,
                        style: FontsConstants.textSemiBold.copyWith(
                          fontSize: maxWidthLess310 ? 26 : 32,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SetAmountButton(
                            amount: amount,
                            incrementButton: onIncrement,
                            decrementButton: onDecrement,
                            isCompact: maxWidthLess310,
                          ),
                        ),
                        Flexible(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: Size(
                                120,
                                maxWidthLess310 ? 40 : 50,
                              ),
                              textStyle: FontsConstants.textRegular.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            onPressed: onAddToCartPressed,
                            icon: const Icon(
                              Icons.add_shopping_cart_sharp,
                              size: 20,
                            ),
                            label: const FittedBox(
                              child: Text('Adicionar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
