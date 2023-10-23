import 'package:mobx/mobx.dart';

import '../../models/product_model.dart';

part 'cart_item.g.dart';

class CartItem = CartItemBase with _$CartItem;

abstract class CartItemBase with Store {
  final ProductModel product;

  @observable
  int amount;

  CartItemBase(this.product, this.amount);

  @computed
  double get getItemTotal => amount * product.price;
}
