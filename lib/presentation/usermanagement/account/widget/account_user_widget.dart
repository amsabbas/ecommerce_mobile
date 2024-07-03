
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

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
            //  Get.to(() => const ProfileScreen(), binding: UserBindings());
            },
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Text(
                      userModel?.name ?? "----",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                              color: AppColors.ceruleanBlueColor,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Text(
                      userModel?.email ?? "----",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.ceruleanBlueColor,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
