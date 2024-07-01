import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class AreasEndPoints {
  static EndPoint getAllEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
  }) {
    return EndPoint(
        endpoint: "addresses/getAreas",
        headers: headers,
        data: data,
        userToken:userToken,
        method: HttpMethod.get);
  }

}
