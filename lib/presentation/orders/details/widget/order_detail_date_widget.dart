
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailDateWidget extends StatelessWidget {
  final String date;

  const OrderDetailDateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MessageKeys.deliveryDateTitle.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold)),
          Text(date,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.mainColor,
                  )),
        ],
      ),
    );
  }
}
