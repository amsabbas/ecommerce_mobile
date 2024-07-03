import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/orders/datasource/end_points/orders_endpoints.dart';
import 'package:ecommerce_mobile/data/orders/model/order_model.dart';

class OrdersRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  OrdersRemoteDataSource({required this.service, required this.authManager});

  Future<List<OrderModel>> getMyOrders() async {
    String? userToken = authManager.getToken();
    return service
        .call(OrdersEndPoints.getMyOrdersEndPoint(userToken: userToken))
        .then((response) =>
            response.map<OrderModel>((e) => OrderModel.fromJson(e)).toList());
  }
}
