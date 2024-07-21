import 'package:ecommerce_mobile/data/products/datasource/products_remote_data_source.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';

class ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepository({required this.remoteDataSource});

  Future<List<ProductModel>> getAllProducts(String? keyword) async {
    return await remoteDataSource.getAllProducts(keyword);
  }

  Future<List<ProductModel>> getAllProductsByCategoryID(int categoryID) async {
    return await remoteDataSource.getAllProductsByCategoryID(categoryID);
  }

  Future addProductToMyCart(int productID, int quantity) async {
    return await remoteDataSource.addProductToMyCart(productID, quantity);
  }
}
