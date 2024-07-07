import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/cart/interactor/cart_interactor.dart';
import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final getMyCartsState = ResultState<List<CartModel>>();
  final deleteCartState = ResultState();
  late final CartInteractor cartInteractor;

  CartController({required this.cartInteractor});

  void getMyCarts() async {
    try {
      getMyCartsState.setLoading();
      getMyCartsState.setSuccess(await cartInteractor.getMyCart());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      getMyCartsState.setError(error);
    }
  }

  void deleteCart(int id) async {
    try {
      deleteCartState.setLoading();
      deleteCartState.setSuccess(await cartInteractor.deleteCart(id));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      deleteCartState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    getMyCartsState.close();
    deleteCartState.close();
  }
}
