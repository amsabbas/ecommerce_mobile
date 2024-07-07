import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/cart/interactor/cart_interactor.dart';
import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';
import 'package:ecommerce_mobile/data/checkout/interactor/checkout_interactor.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final getMyCartsState = ResultState<List<CartModel>>();
  final deleteCartState = ResultState();
  final checkCartAvailabilityState = ResultState();
  late final CartInteractor cartInteractor;
  late final CheckoutInteractor checkOutInteractor;

  CartController(
      {required this.cartInteractor, required this.checkOutInteractor});

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

  void checkCartAvailabilityCart() async {
    try {
      checkCartAvailabilityState.setLoading();
      checkCartAvailabilityState
          .setSuccess(await checkOutInteractor.checkCartAvailabilityCart());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      checkCartAvailabilityState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    getMyCartsState.close();
    deleteCartState.close();
    checkCartAvailabilityState.close();
  }
}
