import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckoutPromoCodeWidget extends StatefulWidget {
  const CheckoutPromoCodeWidget({super.key});

  @override
  State<StatefulWidget> createState() => CheckoutPromoCodeWidgetState();
}

class CheckoutPromoCodeWidgetState extends State<CheckoutPromoCodeWidget> {
  late final CheckoutController _checkoutController;

  @override
  void initState() {
    super.initState();
    _checkoutController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CheckoutController>(
        init: _checkoutController, //here
        builder: (controller) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: _checkoutController.promoCodeController,
                        maxLines: 1,
                        onChanged: (value) {
                          _checkoutController.promoCodeController.text =
                              (value);
                        },
                        enabled: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(500),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            suffixIcon: _checkoutController
                                    .isPromoCodeAdded.value
                                ? IconButton(
                                    onPressed: () {
                                      _checkoutController.removePromoCode();
                                    },
                                    icon: const Icon(Icons.cancel_outlined))
                                : TextButton(
                                    onPressed: () {
                                      _checkoutController.applyPromoCode();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Text(
                                        MessageKeys.checkoutApplyButtonTitle.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: AppColors
                                                    .ceruleanBlueColor)),
                                  ),
                            errorText: _checkoutController.isPromoCodeError.value
                                    ? MessageKeys.noFound.tr
                                    : null,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    _checkoutController.isPromoCodeAdded.value
                                        ? const BorderSide(
                                            color: AppColors.greenColor)
                                        : const BorderSide()),
                            border: OutlineInputBorder(
                                borderSide:
                                    _checkoutController.isPromoCodeAdded.value
                                        ? const BorderSide(
                                            color: AppColors.greenColor)
                                        : const BorderSide()),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            labelText: MessageKeys.checkoutPromoCodeTitle.tr),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text),
                  ),
                ],
              ));
        });
  }
}
