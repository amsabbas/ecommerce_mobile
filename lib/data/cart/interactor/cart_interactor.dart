import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';
import 'package:ecommerce_mobile/data/cart/repository/cart_repository_impl.dart';

class CartInteractor {
  final CartRepository repository;

  CartInteractor({required this.repository});

  Future<List<CartModel>> getMyCart() async {
    return repository.getMyCart();
  }

  Future deleteCart(int id) async {
    return repository.deleteCart(id);
  }
}
