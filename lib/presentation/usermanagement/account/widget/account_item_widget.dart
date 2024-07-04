import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function tapCallback;

  const AccountItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.tapCallback,
  });

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;
    return InkWell(
      onTap: () {
        tapCallback.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.ceruleanBlueColor),
                ),
              ],
            ),
            Transform.flip(
                flipX: isRTL ? true : false,
                child: SvgPicture.asset(
                  AssetResource.accountNextImagePath,
                  width: 10,
                  height: 10,
                )),
          ],
        ),
      ),
    );
  }
}
