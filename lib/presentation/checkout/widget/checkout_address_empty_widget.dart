import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutAddressEmptyWidget extends StatelessWidget {
  final Function addAddressCallback;

  const CheckoutAddressEmptyWidget(
      {super.key, required this.addAddressCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Text.rich(
            TextSpan(
              text: MessageKeys.checkoutNoAddresses.tr,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.mainColor,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: MessageKeys.addAddressButtonTitle.tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.greenColor,
                        decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    fontWeight: FontWeight.w800,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => addAddressCallback.call(),
                ),
                // can add more TextSpans here...
              ],
            ),
          ),
        ),
      ],
    );
  }
}
