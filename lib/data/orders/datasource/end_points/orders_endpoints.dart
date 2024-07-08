import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class OrdersEndPoints {
  static EndPoint getMyOrdersEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken
  }) {
    return EndPoint(
        endpoint: "orders/getMyOrders",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

  static EndPoint createOrderEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken
  }) {
    return EndPoint(
        endpoint: "orders/createOrder",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.post);
  }
}
