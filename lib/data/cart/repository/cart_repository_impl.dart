import 'package:ecommerce_mobile/data/cart/datasource/cart_remote_data_source.dart';
import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';

class CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepository({required this.remoteDataSource});

  Future<List<CartModel>> getMyCart() async {
    return remoteDataSource.getMyCart();
  }

  Future deleteCart(int id) async {
    return remoteDataSource.deleteCart(id);
  }
}
