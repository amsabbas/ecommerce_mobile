import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCircularAnimator(
          size: 100,
          innerIconsSize: 3,
          outerIconsSize: 3,
          innerAnimation: Curves.easeInOutBack,
          outerAnimation: Curves.easeInOutBack,
          innerColor: AppColors.mainColor,
          outerColor: AppColors.mainColor,
          innerAnimationSeconds: 10,
          outerAnimationSeconds: 10,
          child: SvgPicture.asset(
            AssetResource.accountUserImagePath,
            width: 100,
            height: 100,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}
