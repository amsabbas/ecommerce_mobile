import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';
import 'package:ecommerce_mobile/data/orders/model/order_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/orders/details/widget/order_detail_amount_widget.dart';
import 'package:ecommerce_mobile/presentation/orders/details/widget/order_detail_date_widget.dart';
import 'package:ecommerce_mobile/presentation/orders/details/widget/order_detail_payment_widget.dart';
import 'package:ecommerce_mobile/presentation/orders/details/widget/order_detail_products_widget.dart';
import 'package:ecommerce_mobile/presentation/orders/main/widget/my_order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late final AppSettingsController _appSettingsController;

  @override
  void initState() {
    super.initState();
    _appSettingsController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = Get.arguments;
    SettingModel? settingModel = _appSettingsController.settingsState.value.data;
    return Scaffold(
        appBar: AppTopBarWidget(
          title: MessageKeys.orderDetailsTitle.tr,
          showBackIcon: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyOrderItemWidget(
                  orderModel: orderModel,
                ),
                const SizedBox(
                  height: 16,
                ),
                OrderDetailProductsWidget(orderInfo: orderModel.orderItems),
                const SizedBox(
                  height: 16,
                ),
                OrderDetailDateWidget(
                  date: settingModel?.deliveryTime.toString() ?? "",
                ),
                const SizedBox(
                  height: 16,
                ),
                const OrderDetailPaymentWidget(
                  paymentType: "CASH",
                ),
                OrderDetailAmountWidget(
                  deliveryFees: orderModel.deliveryFees,
                  discount: orderModel.discount,
                  subTotal: orderModel.subtotal,
                  totalAmount: orderModel.total,
                )
              ],
            ),
          ),
        ));
  }
}
