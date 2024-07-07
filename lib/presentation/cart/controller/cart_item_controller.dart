import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  final addProductToMyCartState = ResultState();

  late final ProductsInteractor productsInteractor;
  Rx<int> quantity = Rx(1);

  CartItemController({required this.productsInteractor});

  void addProductToMyCart(int productID) async {
    try {
      addProductToMyCartState.setLoading();
      addProductToMyCartState.setSuccess(await productsInteractor
          .addProductToMyCart(productID, quantity.value));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      addProductToMyCartState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    addProductToMyCartState.close();
  }
}
