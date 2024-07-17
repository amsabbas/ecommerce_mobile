import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckoutPaymentItemWidget extends StatelessWidget {
  const CheckoutPaymentItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find();
    return GetX<CheckoutController>(
        init: checkoutController,
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(right: 24.0,left: 24.0, top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MessageKeys.paymentTitle.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.mainColor,
                        fontWeight: FontWeight.bold
                        )),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          checkoutController.paymentMethod.value =
                              cashPayment;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: checkoutController.paymentMethod.value ==
                                    cashPayment
                                ? AppColors.mainColor
                                : AppColors.lightWhiteColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    AssetResource.checkoutCashImagePath,
                                    colorFilter: ColorFilter.mode(
                                        checkoutController
                                                    .paymentMethod.value ==
                                                cashPayment
                                            ? AppColors.whiteColor
                                            : AppColors.mainColor,
                                        BlendMode.srcIn)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  MessageKeys.cash.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: checkoutController
                                                      .paymentMethod.value ==
                                                  cashPayment
                                              ? AppColors.whiteColor
                                              : AppColors.mainColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          checkoutController.paymentMethod.value =
                              visaPayment;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: checkoutController.paymentMethod.value ==
                                    visaPayment
                                ? AppColors.mainColor
                                : AppColors.lightWhiteColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    AssetResource.checkoutVisaImagePath,
                                    colorFilter: ColorFilter.mode(
                                        checkoutController
                                                    .paymentMethod.value ==
                                                visaPayment
                                            ? AppColors.whiteColor
                                            : AppColors.mainColor,
                                        BlendMode.srcIn)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  MessageKeys.visa.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: checkoutController
                                                      .paymentMethod.value ==
                                                  visaPayment
                                              ? AppColors.whiteColor
                                              : AppColors.mainColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
