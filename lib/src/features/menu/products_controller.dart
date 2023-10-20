import 'package:mobx/mobx.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/product_model.dart';
import '../../repositories/products/products_repository.dart';

part 'products_controller.g.dart';

enum ProductsStateStatus {
  initial,
  loading,
  loaded,
  error;
}

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {
  final ProductsRepository _productsRepository;

  @readonly
  var _status = ProductsStateStatus.initial;

  @readonly
  List<ProductModel> _products = [];

  @readonly
  String? _errorMessage;

  ProductsControllerBase(this._productsRepository);

  @action
  Future<void> getProducts(String category) async {
    try {
      _status = ProductsStateStatus.loading;
      _products = await _productsRepository.getProducts(category);
      _status = ProductsStateStatus.loaded;
    } on RepositoryException catch (e) {
      _errorMessage = e.message;
      _status = ProductsStateStatus.error;
    }
  }
}
