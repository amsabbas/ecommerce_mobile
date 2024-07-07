import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/data/products/repository/products_repository_impl.dart';

class ProductsInteractor {
  final ProductsRepository repository;

  ProductsInteractor({required this.repository});

  Future<List<ProductModel>> getAllProducts() async =>
      await repository.getAllProducts();

  Future<List<ProductModel>> getAllProductsByCategoryID(int categoryID) async =>
      await repository.getAllProductsByCategoryID(categoryID);

  Future addProductToMyCart(int productID, int quantity) async =>
      await repository.addProductToMyCart(productID, quantity);
}
