import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddressesEmptyWidget extends StatelessWidget {
  final Function addAddressCallback;

  const AddressesEmptyWidget({super.key, required this.addAddressCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetResource.noDataImagePath,
            width: 130,
            height: 130,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            MessageKeys.noAddresses.tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.mainColor),
          ),
          const SizedBox(
            height: 24,
          ),
          OutlinedButton(
            onPressed: () {
              addAddressCallback.call();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    MessageKeys.addAddressButtonTitle.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
