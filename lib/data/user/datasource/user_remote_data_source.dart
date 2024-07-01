import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/user/datasource/end_points/user_endpoints.dart';
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
        .call(UserEndPoints.profileEndPoint(userToken:userToken))
        .then((response) => UserModel.fromJson(response));
  }
}
