import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:ecommerce_mobile/data/categories/model/category_model.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:get/get.dart';

import '../../../data/base/utils/app_logger.dart';
import '../../base/utils/result.dart';

class ProductsController extends GetxController {
  final productsState = ResultState();
  final categoriesState = ResultState<List<CategoryModel>>();

  late final ProductsInteractor productsInteractor;
  late final CategoryInteractor categoryInteractor;

  ProductsController(
      {required this.productsInteractor,
      required this.categoryInteractor});

  void getProducts() async {
    try {
      productsState.setLoading();
      productsState
          .setSuccess(await productsInteractor.getAllProductsEndPoint());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      productsState.setError(error);
    }
  }

  void getCategories() async {
    try {
      categoriesState.setLoading();
      categoriesState.setSuccess(await categoryInteractor.getAllCategories());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      categoriesState.setError(error);
    }
  }



  @override
  void dispose() {
    super.dispose();
    productsState.close();
    categoriesState.close();
  }
}
