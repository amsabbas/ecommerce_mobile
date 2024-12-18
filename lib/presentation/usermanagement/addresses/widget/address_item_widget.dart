import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressModel addressModel;
  final Function onDeleteCallback;
  final Function onSetDefaultCallback;

  const AddressItemWidget(
      {super.key,
      required this.addressModel,
      required this.onDeleteCallback,
      required this.onSetDefaultCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        margin: const EdgeInsets.all(0),
        color: AppColors.lightWhiteColor,
        elevation: 0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _itemWidget(context, MessageKeys.streetNameTitle.tr,
                          addressModel.streetName),
                      _itemWidget(context, MessageKeys.buildingNoTitle.tr,
                          addressModel.buildingNo),
                      _itemWidget(context, MessageKeys.floorNoTitle.tr,
                          addressModel.floorNo),
                      _itemWidget(context, MessageKeys.apartmentNoTitle.tr,
                          addressModel.apartmentNo),
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      onDeleteCallback.call();
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: addressModel.isDefault,
                      onChanged: (value) {
                        onSetDefaultCallback.call();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    MessageKeys.changeDefaultAddressTitle.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.mainColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWidget(BuildContext context, String key, String value) {
    return Row(
      children: [
        Text("$key: ",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.mainColor, fontWeight: FontWeight.bold)),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.mainColor)),
      ],
    );
  }
}
