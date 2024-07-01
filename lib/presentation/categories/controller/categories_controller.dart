import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/base/utils/app_logger.dart';
import '../../base/utils/result.dart';

class CategoriesController extends GetxController {
  final categoriesState = ResultState();
  late final CategoryInteractor categoriesInteractor;

  CategoriesController({required this.categoriesInteractor});

  void getCategories() async {
    try {
      categoriesState.setLoading();

      categoriesState.setSuccess(await categoriesInteractor.getAllCategories());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      categoriesState.setError(error);
    }
  }


  @override
  void dispose() {
    super.dispose();
    categoriesState.close();
  }
}
