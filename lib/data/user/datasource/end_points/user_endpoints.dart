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

  static EndPoint updateProfileEndPoint({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    required String? userToken,
  }) {
    return EndPoint(
        endpoint: "user/editProfile",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.post);
  }

  static EndPoint getUserAddresses(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken}) {
    return EndPoint(
        endpoint: "addresses/getAddresses",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

  static EndPoint getPrimaryAddress(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken}) {
    return EndPoint(
        endpoint: "addresses/getPrimaryAddress",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }

  static EndPoint addUserAddress(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken}) {
    return EndPoint(
        endpoint: "addresses/createAddress",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.post);
  }

  static EndPoint deleteAddress(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken,
      required int id}) {
    return EndPoint(
        endpoint: "addresses/address/$id",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.delete);
  }

  static EndPoint setDefaultAddress(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken,
      required int id}) {
    return EndPoint(
        endpoint: "addresses/changeAddressToPrimary/$id",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.post);
  }

  static EndPoint getMyCartCount(
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required String? userToken}) {
    return EndPoint(
        endpoint: "cart/cartCount",
        headers: headers,
        data: data,
        userToken: userToken,
        method: HttpMethod.get);
  }
}
