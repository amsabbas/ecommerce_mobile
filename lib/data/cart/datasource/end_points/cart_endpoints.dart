import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class CartEndPoints {
  static EndPoint getMyCartEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
  }) {
    return EndPoint(
        endpoint: "cart/getMyCart",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

  static EndPoint deleteCartEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
    required int id,
  }) {
    return EndPoint(
        endpoint: "cart/$id",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.delete);
  }
}
