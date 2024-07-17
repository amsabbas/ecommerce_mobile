import 'package:ecommerce_mobile/data/orders/model/order_model.dart';
import 'package:ecommerce_mobile/presentation/base/extension/date_string_extension.dart';
import 'package:ecommerce_mobile/presentation/base/extension/string_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/orders/details/screen/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class MyOrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;

  const MyOrderItemWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const OrderDetailsScreen(), arguments: orderModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Card(
          margin: const EdgeInsets.all(0),
          color: AppColors.lightWhiteColor,
          elevation: 0.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _orderNumberAndStatus(context),
                      _orderDate(context),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _orderPrice(context),
                            _orderQuantity(context),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _orderNumberAndStatus(context) {
    String status = orderModel.status.getStatus();
    Color statusColor = orderModel.status.getStatusColor();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(MessageKeys.orderNumberTitle.tr,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold)),
            Text("#${orderModel.id}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.mainColor,
                    )),
          ],
        ),
        Animate(
          effects: const [FlipEffect()],
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: statusColor),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
              child: Text(status,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.whiteColor,
                      )),
            ),
          ),
        ),
      ],
    );
  }

  Widget _orderDate(context) {
    return Row(
      children: [
        Text(
            "${MessageKeys.orderDateTitle.tr} ${orderModel.date.getFormattedDate()}",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.mainColor,
                )),
      ],
    );
  }

  Widget _orderPrice(context) {
    return Text("${orderModel.total} ${MessageKeys.currency.tr}",
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.greenColor,
            ));
  }

  Widget _orderQuantity(context) {
    return Row(
      children: [
        Text("${MessageKeys.orderQuantityTitle.tr} ${_getQuantity()}",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.mainColor,
                )),
      ],
    );
  }

  int _getQuantity() {
    int quantity = 0;
    for (var element in orderModel.orderItems) {
      quantity += element.quantity;
    }
    return quantity;
  }
}
