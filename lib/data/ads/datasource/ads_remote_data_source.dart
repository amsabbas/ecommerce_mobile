import 'package:ecommerce_mobile/data/ads/datasource/end_points/ads_endpoints.dart';
import 'package:ecommerce_mobile/data/ads/model/ad_model.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';

class AdsRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  AdsRemoteDataSource(
      {required this.service, required this.authManager});

  Future<List<AdModel>> getAllAds() async {
    return service.call(AdsEndPoints.getAllEndPoint()).then(
        (response) => response
            .map<AdModel>((e) => AdModel.fromJson(e))
            .toList());
  }

}
