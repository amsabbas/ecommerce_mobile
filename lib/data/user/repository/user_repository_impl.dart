import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/user/datasource/user_remote_data_source.dart';
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
      await authManager.deleteToken();
      await authManager.deleteUser();
    } catch (_) {}
    return authManager.deleteUser();
  }
}
