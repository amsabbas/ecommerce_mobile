import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../language/language.dart';
import '../style/colors.dart';

class AppErrorWidget extends StatelessWidget {
  final Function retryCallback;

  const AppErrorWidget({super.key, required this.retryCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: AppColors.redColor, size: 140),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              retryCallback.call();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MessageKeys.retry.tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
