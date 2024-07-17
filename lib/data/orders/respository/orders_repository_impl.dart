import 'package:ecommerce_mobile/data/orders/datasource/orders_remote_data_source.dart';
import 'package:ecommerce_mobile/data/orders/model/order_model.dart';

class OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepository({required this.remoteDataSource});

  Future<List<OrderModel>> getMyOrders() async {
    return await remoteDataSource.getMyOrders();
  }

  Future createOrder(String? promoCode) async {
    return await remoteDataSource.createOrder(promoCode);
  }

  Future<String> createOnlineOrder(String? promoCode) async {
    return await remoteDataSource.createOnlineOrder(promoCode);
  }
}
