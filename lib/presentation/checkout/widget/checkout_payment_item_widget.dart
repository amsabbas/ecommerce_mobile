import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPaymentItemWidget extends StatelessWidget {
  final String paymentType;

  const CheckoutPaymentItemWidget({super.key, required this.paymentType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MessageKeys.paymentTitle.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.ceruleanBlueColor,
                  fontWeight: FontWeight.bold)),
          Text(paymentType,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.ceruleanBlueColor,
                  )),
        ],
      ),
    );
  }
}
