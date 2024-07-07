import 'package:ecommerce_mobile/data/checkout/datasource/checkout_remote_data_source.dart';
import 'package:ecommerce_mobile/data/checkout/model/cost_model.dart';

class CheckoutRepository {
  final CheckoutRemoteDataSource remoteDataSource;

  CheckoutRepository({required this.remoteDataSource});

  Future checkCartAvailabilityCart() async {
    return remoteDataSource.checkCartAvailability();
  }

  Future<CostModel> calculateCost(String? promoCode ) async {
    return remoteDataSource.calculateCost(promoCode);
  }
}
