import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/user/datasource/end_points/user_endpoints.dart';
import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/data/user/model/login_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';

class UserRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  UserRemoteDataSource({required this.service, required this.authManager});

  Future<LoginModel> login(String email, String password) async {
    Map<String, String> map = {'email': email, 'password': password};
    return service
        .call(UserEndPoints.loginEndPoint(data: map))
        .then((response) => LoginModel.fromJson(response));
  }

  Future<UserModel> profile() async {
    final userToken = authManager.getToken();
    return service
        .call(UserEndPoints.profileEndPoint(userToken: userToken))
        .then((response) => UserModel.fromJson(response));
  }

  Future forgotPassword(String email) async {
    Map<String, String> map = {'email': email};
    return service.call(UserEndPoints.forgotEndPoint(data: map));
  }

  Future register(
      String email, String name, String phone, String password) async {
    Map<String, String> map = {
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
      'role': 'user'
    };
    return service.call(UserEndPoints.registerEndPoint(data: map));
  }

  Future updateProfile(String name, String phone) async {
    final userToken = authManager.getToken();
    Map<String, String> map = {'name': name, 'phone': phone};
    return service.call(
        UserEndPoints.updateProfileEndPoint(data: map, userToken: userToken));
  }

  Future<List<AddressModel>> getUserAddresses() async {
    final userToken = authManager.getToken();
    return service
        .call(UserEndPoints.getUserAddresses(userToken: userToken))
        .then((response) => response
            .map<AddressModel>((e) => AddressModel.fromJson(e))
            .toList());
  }

  Future addAddress(int areaId, String street, String buildingNumber,
      String floorNumber, String apartmentNumber, double lat, double lon) async {
    final userToken = authManager.getToken();
    Map<String, dynamic> map = {
      'area_id': areaId,
      'street_name': street,
      "building_no": buildingNumber,
      "floor_no": floorNumber,
      "apartment_no": apartmentNumber,
      'lat': lat.toString(),
      'lon': lon.toString(),
    };
    return service
        .call(UserEndPoints.addUserAddress(userToken: userToken, data: map));
  }

  Future deleteAddress(int id) async {
    final userToken = authManager.getToken();
    return service
        .call(UserEndPoints.deleteAddress(userToken: userToken, id: id));
  }

  Future setDefaultAddress(int id) async {
    final userToken = authManager.getToken();
    return service
        .call(UserEndPoints.setDefaultAddress(userToken: userToken, id: id));
  }
}
