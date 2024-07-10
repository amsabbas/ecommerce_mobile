import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutAddressItemWidget extends StatelessWidget {
  final AddressModel addressModel;

  const CheckoutAddressItemWidget({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MessageKeys.shippingAddressTitle.tr,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.mainColor,fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.darkGrayColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _itemWidget(context, MessageKeys.streetNameTitle.tr, addressModel.streetName),
                      _itemWidget(context, MessageKeys.buildingNoTitle.tr, addressModel.buildingNo),
                      _itemWidget(context, MessageKeys.floorNoTitle.tr, addressModel.floorNo),
                      _itemWidget(context, MessageKeys.apartmentNoTitle.tr, addressModel.apartmentNo),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(BuildContext context, String key, String value) {
    return Row(
      children: [
        Text("$key: ",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.mainColor,fontWeight: FontWeight.bold)),

        Expanded(
          child: Text(value,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.mainColor)),
        ),
      ],
    );
  }
}
