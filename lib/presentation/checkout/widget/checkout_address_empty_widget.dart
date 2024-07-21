import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckoutAddressEmptyWidget extends StatelessWidget {
  final Function addAddressCallback;

  const CheckoutAddressEmptyWidget(
      {super.key, required this.addAddressCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 64.0),
      child: Column(
        children: [
          SvgPicture.asset(
            AssetResource.noDataImagePath,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () {
              addAddressCallback.call();
            },
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 1, // Space between underline and text
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: AppColors.mainColor,
                width: 1.0, // Underline thickness
              ))),
              child: Text(
                MessageKeys.checkoutNoAddresses.tr,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.mainColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
