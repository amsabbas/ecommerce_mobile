import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/data/products/repository/products_repository_impl.dart';

class ProductsInteractor {
  final ProductsRepository repository;

  ProductsInteractor({required this.repository});

  Future<List<ProductModel>> getAllProductsEndPoint() async =>
      await repository.getAllProductsEndPoint();

}
