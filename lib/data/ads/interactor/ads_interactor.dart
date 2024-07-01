import 'package:ecommerce_mobile/data/ads/model/ad_model.dart';
import 'package:ecommerce_mobile/data/ads/repository/ads_repository_impl.dart';

class AdsInteractor {
  final AdsRepository repository;

  AdsInteractor({required this.repository});

  Future<List<AdModel>> getAllAds() async =>
      await repository.getAllAds();
}
