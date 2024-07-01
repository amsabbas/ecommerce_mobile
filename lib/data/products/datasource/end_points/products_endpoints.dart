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


}
