import 'package:mobx/mobx.dart';

import '../../models/product_model.dart';
import 'cart_item.dart';

part 'cart_store.g.dart';

class CartStore = CartStoreBase with _$CartStore;

abstract class CartStoreBase with Store {
  @observable
  ObservableList<CartItem> cart = ObservableList<CartItem>();

  @computed
  double get getCartTotal => cart.fold(0, (previousValue, element) {
        return previousValue + element.getItemTotal;
      });

  bool alredyInCart(ProductModel product) {
    return cart.any((item) => item.product.id == product.id);
  }

  @action
  void addToCart(ProductModel product, int amount) {
    if (amount <= 0) return;

    cart.add(
      CartItem(product, amount),
    );
  }

  @action
  void updateCartItemAmount(ProductModel product, int increaseAmount) {
    final cartItemIndex =
        cart.indexWhere((item) => item.product.id == product.id);

    final newAmount = cart[cartItemIndex].amount + increaseAmount;

    if (newAmount == 0) {
      cart.removeAt(cartItemIndex);
      return;
    }

    cart[cartItemIndex].amount = newAmount;
  }
}
