import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/data/user/model/login_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';

import '../repository/user_repository_impl.dart';

class UserInteractor {
  final UserRepository repository;

  UserInteractor({required this.repository});

  Future<LoginModel> login(String email, String password) async =>
      await repository.login(email, password);

  Future forgotPassword(String email) async =>
      await repository.forgotPassword(email);

  Future register(
          String email, String name, String phone, String password) async =>
      await repository.register(email, name, phone, password);

  Future updateProfile(String name, String phone) async =>
      await repository.updateProfile(name, phone);

  Future<List<AddressModel>> getUserAddresses() async =>
      await repository.getUserAddresses();

  Future addAddress(int areaId, String street, String buildingNumber,
      String floorNumber, String apartmentNumber, double lat, double lon) async =>
      await repository.addAddress(areaId, street, buildingNumber,
          floorNumber, apartmentNumber, lat, lon);

  Future deleteAddress(int addressId) async =>
      await repository.deleteAddress(addressId);

  Future changeDefaultAddress(int addressId) async =>
      await repository.changeDefaultAddress(addressId);

  Future<UserModel> getProfile() async => await repository.getProfile();

  Future<UserModel?> getSavedUser() async => await repository.getSavedUser();

  Future logout() async => await repository.logout();
}
