// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on CartStoreBase, Store {
  Computed<double>? _$getCartTotalComputed;

  @override
  double get getCartTotal =>
      (_$getCartTotalComputed ??= Computed<double>(() => super.getCartTotal,
              name: 'CartStoreBase.getCartTotal'))
          .value;

  late final _$cartAtom = Atom(name: 'CartStoreBase.cart', context: context);

  @override
  ObservableList<CartItem> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(ObservableList<CartItem> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$CartStoreBaseActionController =
      ActionController(name: 'CartStoreBase', context: context);

  @override
  void addToCart(ProductModel product, int amount) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.addToCart');
    try {
      return super.addToCart(product, amount);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCartItemAmount(ProductModel product, int increaseAmount) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.updateCartItemAmount');
    try {
      return super.updateCartItemAmount(product, increaseAmount);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
getCartTotal: ${getCartTotal}
    ''';
  }
}
