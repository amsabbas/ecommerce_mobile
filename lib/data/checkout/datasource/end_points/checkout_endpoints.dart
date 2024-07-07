import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class CheckoutEndpoints {
  static EndPoint calculateCostEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
  }) {
    return EndPoint(
        endpoint: "checkout/cost",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

  static EndPoint checkCartAvailabilityEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
  }) {
    return EndPoint(
        endpoint: "checkout/checkCartAvailability",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }
}
