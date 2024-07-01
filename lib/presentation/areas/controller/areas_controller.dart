import 'package:ecommerce_mobile/data/areas/interactor/area_interactor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/base/utils/app_logger.dart';
import '../../base/utils/result.dart';

class AreasController extends GetxController {
  final areasState = ResultState();

  late final AreaInteractor areaInteractor;

  AreasController({required this.areaInteractor});

  void getAreas() async {
    try {
      areasState.setLoading();

      areasState.setSuccess(await areaInteractor.getAllAreas());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      areasState.setError(error);
    }
  }



  @override
  void dispose() {
    super.dispose();
    areasState.close();
  }
}
