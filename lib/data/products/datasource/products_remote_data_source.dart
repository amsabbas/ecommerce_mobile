import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/products/datasource/end_points/products_endpoints.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';

class ProductsRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  ProductsRemoteDataSource({required this.service, required this.authManager});

  Future<List<ProductModel>> getAllProducts() async {
    return service.call(ProductsEndPoints.getAllProductsEndPoint()).then(
        (response) => response
            .map<ProductModel>((e) => ProductModel.fromJson(e))
            .toList());
  }

  Future<List<ProductModel>> getAllProductsByCategoryID(int categoryID) async {
    return service
        .call(ProductsEndPoints.getAllProductsByCategoryIDEndPoint(
            categoryID: categoryID))
        .then((response) => response
            .map<ProductModel>((e) => ProductModel.fromJson(e))
            .toList());
  }

  Future addProductToMyCart(int productID, int quantity) async {
    Map<String, dynamic> map = {'product_id': productID, 'quantity': quantity};
    String? userToken = authManager.getToken();
    return service.call(ProductsEndPoints.addProductToMyCartEndPoint(
        userToken: userToken, data: map));
  }
}
