import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/orders/interactor/order_interactor.dart';
import 'package:ecommerce_mobile/data/orders/model/order_model.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final OrderInteractor interactor;
  final ordersState = ResultState<List<OrderModel>>();

  OrdersController({required this.interactor});

  void getMyOrders() async {
    try {
      ordersState.setLoading();
      ordersState.setSuccess(await interactor.getMyOrders());
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      ordersState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    ordersState.close();
  }
}
