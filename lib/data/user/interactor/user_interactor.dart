import 'package:ecommerce_mobile/data/user/model/login_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';

import '../repository/user_repository_impl.dart';

class UserInteractor {
  final UserRepository repository;

  UserInteractor({required this.repository});

  Future<LoginModel> login(String email, String password) async =>
      await repository.login(email, password);

  Future<UserModel> getProfile() async => await repository.getProfile();

  Future<UserModel?> getSavedUser() async => await repository.getSavedUser();

  Future logout() async => await repository.logout();
}
