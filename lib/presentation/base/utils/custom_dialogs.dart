import 'package:flutter/material.dart';

import '../style/colors.dart';

class CustomDialogs {

  static void showConfirmationDialog(
      {required BuildContext context,
      required String title,
      required String message,
      required String positiveButtonTitle,
      required String negativeButtonTitle,
      Function? positiveCallBack,
      Function? negativeCallBack}) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              color: Colors.white, // Dialog background
              width: 500, // Dialog width
              height: 200, // Dialog height
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.ceruleanBlueColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.ceruleanBlueColor,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            child: Text(
                              positiveButtonTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.ceruleanBlueColor,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              positiveCallBack?.call();
                            }),
                        const SizedBox(width: 16),
                        TextButton(
                            child: Text(
                              negativeButtonTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.ceruleanBlueColor,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              negativeCallBack?.call();
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
