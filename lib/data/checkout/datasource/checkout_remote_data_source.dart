import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/checkout/datasource/end_points/checkout_endpoints.dart';
import 'package:ecommerce_mobile/data/checkout/model/cost_model.dart';

class CheckoutRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  CheckoutRemoteDataSource({required this.service, required this.authManager});

  Future<CostModel> calculateCost(String? promoCode) async {
    String? userToken = authManager.getToken();
    return service
        .call(CheckoutEndpoints.calculateCostEndPoint(
            userToken: userToken, data: {"promoCode": promoCode}))
        .then((response) => CostModel.fromJson(response));
  }

  Future checkCartAvailability() async {
    String? userToken = authManager.getToken();
    return service.call(
        CheckoutEndpoints.checkCartAvailabilityEndPoint(userToken: userToken));
  }
}
