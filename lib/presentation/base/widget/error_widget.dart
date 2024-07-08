import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../language/language.dart';
import '../style/colors.dart';

class AppErrorWidget extends StatelessWidget {
  final Function retryCallback;

  const AppErrorWidget({super.key, required this.retryCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetResource.errorImagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            MessageKeys.unKnown.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.mainColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                retryCallback.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      MessageKeys.retry.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
