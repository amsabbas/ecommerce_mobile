import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class AccountUserWidget extends StatelessWidget {
  const AccountUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return GetX<UserController>(
        init: userController,
        builder: (controller) {
          UserModel? userModel = userController.userState.value;
          return GestureDetector(
            onTap: () {
              Get.to(() => const ProfileScreen(),
                  binding: UserBindings(), transition: appTransition);
            },
            child: Row(
              children: [
                WidgetCircularAnimator(
                  size: 50,
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
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Animate(
                        effects: const [FlipEffect()],
                        child: Text(
                          userModel?.name ?? "----",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Animate(
                        effects: const [FlipEffect()],
                        child: Text(
                          userModel?.email ?? "----",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.mainColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
