import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/cart/datasource/end_points/cart_endpoints.dart';
import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';

class CartRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  CartRemoteDataSource({required this.service, required this.authManager});

  Future<List<CartModel>> getMyCart() async {
    String? userToken = authManager.getToken();
    return service
        .call(CartEndPoints.getMyCartEndPoint(userToken: userToken))
        .then((response) =>
            response.map<CartModel>((e) => CartModel.fromJson(e)).toList());
  }

  Future deleteCart(int id) async {
    String? userToken = authManager.getToken();
    return service
        .call(CartEndPoints.deleteCartEndPoint(userToken: userToken, id: id));
  }
}
