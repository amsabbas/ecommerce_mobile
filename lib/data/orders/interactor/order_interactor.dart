import 'package:ecommerce_mobile/data/orders/model/order_model.dart';
import 'package:ecommerce_mobile/data/orders/respository/orders_repository_impl.dart';

class OrderInteractor {
  final OrdersRepository repository;

  OrderInteractor({required this.repository});

  Future<List<OrderModel>> getMyOrders() async =>
      await repository.getMyOrders();
}
