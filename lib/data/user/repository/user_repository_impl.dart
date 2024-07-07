import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/user/datasource/user_remote_data_source.dart';
import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/data/user/model/login_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';

class UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final AuthManager authManager;

  UserRepository({required this.remoteDataSource, required this.authManager});

  Future<LoginModel> login(String email, String password) async {
    LoginModel loginModel = await remoteDataSource.login(email, password);
    await authManager.saveToken(loginModel);
    return loginModel;
  }

  Future forgotPassword(String email) async {
    return remoteDataSource.forgotPassword(email);
  }

  Future register(
      String email, String name, String phone, String password) async {
    return remoteDataSource.register(email, name, phone, password);
  }

  Future updateProfile(String name, String phone) async {
    return remoteDataSource.updateProfile(name, phone);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    return remoteDataSource.getUserAddresses();
  }

  Future<AddressModel> getPrimaryAddress() async {
    return remoteDataSource.getPrimaryAddress();
  }

  Future addAddress(
      int areaId,
      String street,
      String buildingNumber,
      String floorNumber,
      String apartmentNumber,
      double lat,
      double lon) async {
    return remoteDataSource.addAddress(
        areaId, street, buildingNumber, floorNumber, apartmentNumber, lat, lon);
  }

  Future deleteAddress(int addressId) async {
    return remoteDataSource.deleteAddress(addressId);
  }

  Future changeDefaultAddress(int addressId) async {
    return remoteDataSource.setDefaultAddress(addressId);
  }

  Future<int> getCartCount() async {
    return remoteDataSource.getMyCartCount();
  }

  Future<UserModel> getProfile() async {
    UserModel model = await remoteDataSource.profile();
    await authManager.saveUser(model);
    return model;
  }

  Future<UserModel?> getSavedUser() async {
    return authManager.getUser();
  }

  Future logout() async {
    try {
      await remoteDataSource.logoutEndPoint();
    } catch (_) {}
    await authManager.deleteToken();
    await authManager.deleteUser();
  }

  void saveFCMToken(String token) {
    authManager.saveFCMToken(token);
  }

  Future sendPushNotificationToken() {
    String token = authManager.getFCMToken();
    return remoteDataSource.sendPushNotificationTokenEndPoint(token);
  }
}
