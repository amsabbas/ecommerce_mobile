import 'package:ecommerce_mobile/data/orders/datasource/orders_remote_data_source.dart';
import 'package:ecommerce_mobile/data/orders/model/order_model.dart';

class OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepository({required this.remoteDataSource});

  Future<List<OrderModel>> getMyOrders() async {
    return await remoteDataSource.getMyOrders();
  }
}
