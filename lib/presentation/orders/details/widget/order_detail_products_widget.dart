import 'package:ecommerce_mobile/data/orders/model/order_item_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailProductsWidget extends StatelessWidget {
  final List<OrderItemModel> orderInfo;

  const OrderDetailProductsWidget({super.key, required this.orderInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MessageKeys.productsTitle.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.ceruleanBlueColor,
                  fontWeight: FontWeight.bold)),
          _productsWidget(context)
        ],
      ),
    );
  }

  Widget _productsWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(orderInfo.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(orderInfo[index].product.getNameByLocale(Get.locale.toString()) ?? "",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.ceruleanBlueColor,
                    )),
            Text("x${orderInfo[index].quantity}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.ceruleanBlueColor,
                    )),
          ],
        );
      }),
    );
  }
}
