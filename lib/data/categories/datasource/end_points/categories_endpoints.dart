import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class CategoriesEndPoints {
  static EndPoint getAllCategoriesEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) {
    return EndPoint(
        endpoint: "categories/getAllCategories",
        headers: headers,
        data: data,
        method: HttpMethod.get);
  }
}
