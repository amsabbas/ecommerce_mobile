import 'package:ecommerce_mobile/data/categories/model/category_model.dart';
import 'package:ecommerce_mobile/data/categories/repository/categories_repository_impl.dart';

class CategoryInteractor {
  final CategoriesRepository repository;

  CategoryInteractor({required this.repository});

  Future<List<CategoryModel>> getAllCategories() async =>
      await repository.getAllCategories();
}
