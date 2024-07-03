import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class SettingsEndPoints {

  static EndPoint getAppSettings(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken}) {
    return EndPoint(
        endpoint: "config/appInfo",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

}
