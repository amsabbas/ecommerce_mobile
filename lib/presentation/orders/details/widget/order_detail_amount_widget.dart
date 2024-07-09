import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailAmountWidget extends StatelessWidget {
  final double subTotal;
  final double deliveryFees;
  final double discount;
  final double totalAmount;

  const OrderDetailAmountWidget({
    super.key,
    required this.subTotal,
    required this.deliveryFees,
    required this.discount,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _getAmountWidget(context, MessageKeys.subTotalTitle.tr,
              "${subTotal.roundDouble()} ${MessageKeys.currency.tr}"),
          _getAmountWidget(context, MessageKeys.deliveryFeesTitle.tr,
              "${deliveryFees.roundDouble()} ${MessageKeys.currency.tr}"),
          _getAmountWidget(context, MessageKeys.discountTitle.tr,
              "${discount.roundDouble()} ${MessageKeys.currency.tr}"),
          _getAmountWidget(context, MessageKeys.totalAmountTitle.tr,
              "${totalAmount.roundDouble()} ${MessageKeys.currency.tr}")
        ],
      ),
    );
  }

  Widget _getAmountWidget(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold)),
        Text(value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.mainColor,
                )),
      ],
    );
  }
}
