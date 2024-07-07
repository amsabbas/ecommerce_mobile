import 'package:ecommerce_mobile/data/checkout/model/cost_model.dart';
import 'package:ecommerce_mobile/data/checkout/repository/checkout_repository_impl.dart';

class CheckoutInteractor {
  final CheckoutRepository repository;

  CheckoutInteractor({required this.repository});

  Future<CostModel> calculateCost(String? promoCode) async {
    return repository.calculateCost(promoCode);
  }

  Future checkCartAvailabilityCart() async {
    return repository.checkCartAvailabilityCart();
  }
}
