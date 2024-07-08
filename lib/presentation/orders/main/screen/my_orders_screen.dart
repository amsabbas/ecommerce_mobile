import 'package:ecommerce_mobile/data/orders/model/order_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/widget/account_not_logged_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/empty_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/error_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/orders/base/controller/orders_controller.dart';
import 'package:ecommerce_mobile/presentation/orders/main/widget/my_order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late final OrdersController _ordersController;
  late final UserController _userController;
  late final Worker _userWorker;

  @override
  void initState() {
    super.initState();
    _ordersController = Get.find();
    _userController = Get.find();
    if (_userController.userState.value != null) {
      _ordersController.getMyOrders();
    }

    _userWorker = ever(
        _userController.userState,
        (UserModel? userModel) => {
              if (userModel != null) {_ordersController.getMyOrders()}
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTopBarWidget(
          title: MessageKeys.ordersTitle.tr,
          showBackIcon: false,
        ),
        body: GetX<UserController>(
            init: _userController,
            builder: (controller) {
              UserModel? userModel = _userController.userState.value;
              if (userModel != null) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: GetX<OrdersController>(
                        init: _ordersController,
                        builder: (controller) => controller.ordersState
                            .handleStateInWidget(
                                onSuccess: (context, data) => myOrdersWidget(),
                                onLoading: (context, data) =>
                                    loadingWidget(context),
                                onNormal: (context, data) =>
                                    loadingWidget(context),
                                onError: (context, data) => _errorWidget(),
                                context: context)));
              } else {
                return const AccountNotLoggedWidget();
              }
            }));
  }

  Widget myOrdersWidget() {
    List<OrderModel> response = _ordersController.ordersState.value.data;

    if (response.isEmpty) {
      return Column(
        children: [
          Expanded(
            child: Center(
              child: EmptyWidget(
                message: MessageKeys.noOrdersTitle.tr,
              ),
            ),
          ),
        ],
      );
    } else {
      return RefreshIndicator(
        color: AppColors.mainColor,
        onRefresh: () async {
          _ordersController.getMyOrders();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(
                    response.length,
                    (index) => MyOrderItemWidget(
                          orderModel: response[index],
                        )),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _errorWidget() {
    return Center(
      child: AppErrorWidget(retryCallback: () {
        _ordersController.getMyOrders();
      }),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _userWorker.dispose();
  }
}
