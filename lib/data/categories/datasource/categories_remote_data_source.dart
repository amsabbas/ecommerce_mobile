import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/categories/datasource/end_points/categories_endpoints.dart';
import 'package:ecommerce_mobile/data/categories/model/category_model.dart';

class CategoriesRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  CategoriesRemoteDataSource(
      {required this.service, required this.authManager});

  Future<List<CategoryModel>> getAllCategories() async {
    return service.call(CategoriesEndPoints.getAllCategoriesEndPoint()).then(
        (response) => response
            .map<CategoryModel>((e) => CategoryModel.fromJson(e))
            .toList());
  }

}
