// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartItem on CartItemBase, Store {
  Computed<double>? _$getItemTotalComputed;

  @override
  double get getItemTotal =>
      (_$getItemTotalComputed ??= Computed<double>(() => super.getItemTotal,
              name: 'CartItemBase.getItemTotal'))
          .value;

  late final _$amountAtom = Atom(name: 'CartItemBase.amount', context: context);

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
getItemTotal: ${getItemTotal}
    ''';
  }
}
