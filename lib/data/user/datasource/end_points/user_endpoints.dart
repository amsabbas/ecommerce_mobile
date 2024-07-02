import 'package:ecommerce_mobile/data/base/utils/end_point.dart';

class UserEndPoints {

  static EndPoint loginEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) {
    return EndPoint(
        endpoint: "auth/login",
        headers: headers,
        data: data,
        method: HttpMethod.post);
  }

  static EndPoint profileEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
  }) {
    return EndPoint(
        endpoint: "user/profile",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

  static EndPoint forgotEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) {
    return EndPoint(
        endpoint: "auth/forgotPassword",
        headers: headers,
        data: data,
        method: HttpMethod.post);
  }

  static EndPoint registerEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) {
    return EndPoint(
        endpoint: "auth/register",
        headers: headers,
        data: data,
        method: HttpMethod.post);
  }


}
