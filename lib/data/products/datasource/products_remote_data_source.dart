import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/products/datasource/end_points/products_endpoints.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';

class ProductsRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  ProductsRemoteDataSource({required this.service, required this.authManager});

  Future<List<ProductModel>> getAllProductsEndPoint() async {
    return service.call(ProductsEndPoints.getAllProductsEndPoint()).then(
        (response) => response
            .map<ProductModel>((e) => ProductModel.fromJson(e))
            .toList());
  }

}
