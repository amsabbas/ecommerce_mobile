import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class AdsEndPoints {
  static EndPoint getAllEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) {
    return EndPoint(
        endpoint: "ads/getAllAds",
        headers: headers,
        data: data,
        method: HttpMethod.get);
  }


}
