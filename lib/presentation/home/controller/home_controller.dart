import 'package:ecommerce_mobile/data/ads/interactor/ads_interactor.dart';
import 'package:ecommerce_mobile/data/ads/model/ad_model.dart';
import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:ecommerce_mobile/data/categories/model/category_model.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:get/get.dart';

import '../../../data/base/utils/app_logger.dart';
import '../../base/utils/result.dart';

class HomeController extends GetxController {
  final adsState = ResultState<List<AdModel>>();
  final categoriesState = ResultState<List<CategoryModel>>();
  final productsState = ResultState<List<ProductModel>>();
  final homeState = ResultState();
  late final AdsInteractor adsInteractor;
  late final ProductsInteractor productsInteractor;
  late final CategoryInteractor categoryInteractor;

  Rx<int> selectedCategory = Rx(0);

  HomeController(
      {required this.adsInteractor,
      required this.categoryInteractor,
      required this.productsInteractor});

  void getHomeData() async {
    try {
      homeState.setLoading();
      adsState.setLoading();
      categoriesState.setLoading();
      adsState.setSuccess(await adsInteractor.getAllAds());
      categoriesState.setSuccess(await categoryInteractor.getAllCategories());
      List<CategoryModel> categories = categoriesState.value.data;
      if (categories.isNotEmpty) {
        productsState.setSuccess(await productsInteractor
            .getAllProductsByCategoryID(categories[0].id));
        selectedCategory.value = categories[0].id;
      }
      homeState.setSuccess(null);
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      adsState.setError(error);
      categoriesState.setError(error);
      homeState.setError(error);
    }
  }

  void setSelectedCategoryID(int categoryId) {
    selectedCategory.value = categoryId;
    getProductsByCategoryID(categoryId);
  }

  void getProductsByCategoryID(int categoryID) async {
    try {
      productsState.setLoading();
      productsState.setSuccess(await productsInteractor.getAllProductsByCategoryID(categoryID));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      productsState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    adsState.close();
    categoriesState.close();
    homeState.close();
    productsState.close();
  }
}
