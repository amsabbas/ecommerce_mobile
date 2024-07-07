import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';

class CheckoutPriceItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const CheckoutPriceItemWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.ceruleanBlueColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$value $currency",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.ceruleanBlueColor,
                  ),
            ),
          ],
        ));
  }
}
