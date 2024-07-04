import 'package:ecommerce_mobile/data/ads/interactor/ads_interactor.dart';
import 'package:ecommerce_mobile/data/ads/model/ad_model.dart';
import 'package:get/get.dart';

import '../../../data/base/utils/app_logger.dart';
import '../../base/utils/result.dart';

class HomeController extends GetxController {
  final adsState = ResultState<List<AdModel>>();

  late final AdsInteractor adsInteractor;

  HomeController({required this.adsInteractor});

  void getAds() async {
    try {
      adsState.setLoading();
      adsState.setSuccess(await adsInteractor.getAllAds());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      adsState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    adsState.close();
  }
}
