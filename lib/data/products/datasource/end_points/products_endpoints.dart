import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class ProductsEndPoints {
  static EndPoint getAllProductsEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) {
    return EndPoint(
        endpoint: "products/getAllProducts",
        headers: headers,
        data: data,
        method: HttpMethod.get);
  }

  static EndPoint getAllProductsByCategoryIDEndPoint(
      {Map<String, dynamic>? headers,
        Map<String, dynamic>? data,
        required int categoryID}) {
    return EndPoint(
        endpoint: "products/getAllProductsByCategoryID/${categoryID}",
        headers: headers,
        data: data,
        method: HttpMethod.get);
  }

  static EndPoint addProductToMyCartEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken
  }) {
    return EndPoint(
        endpoint: "cart/addToMyCart",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.post);
  }
}
