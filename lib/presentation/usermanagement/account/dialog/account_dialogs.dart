import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDialogs {
  static String? _groupValue = "en";

  static void showLanguageDialog(
      BuildContext context, Function positiveCallBack) {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(
        StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              surfaceTintColor: AppColors.whiteColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              title: Text(
                MessageKeys.changeLanguageDialogTitle.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Radio(
                          value: "en",
                          groupValue: _groupValue,
                          onChanged: (newValue) => {
                            setState(() {
                              _groupValue = newValue;
                            })
                          },
                        ),
                        Text(
                          MessageKeys.englishTitle.tr,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: "ar",
                          groupValue: _groupValue,
                          onChanged: (newValue) => {
                            setState(() {
                              _groupValue = newValue;
                            })
                          },
                        ),
                        Text(
                          MessageKeys.arabicTitle.tr,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    child: Text(MessageKeys.ok.tr,
                        style: Theme.of(context).textTheme.bodyMedium),
                    onPressed: () {
                      Navigator.pop(context);
                      positiveCallBack.call(_groupValue);
                    }),
                TextButton(
                    child: Text(MessageKeys.cancel.tr,
                        style: Theme.of(context).textTheme.bodyMedium),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          },
        ),
        barrierDismissible: false,
      ),
    );
  }
}
