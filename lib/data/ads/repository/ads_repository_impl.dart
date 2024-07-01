import 'package:ecommerce_mobile/data/ads/datasource/ads_remote_data_source.dart';
import 'package:ecommerce_mobile/data/ads/model/ad_model.dart';

class AdsRepository {
  final AdsRemoteDataSource remoteDataSource;

  AdsRepository({required this.remoteDataSource});

  Future<List<AdModel>> getAllAds() async {
    return await remoteDataSource.getAllAds();
  }

}
