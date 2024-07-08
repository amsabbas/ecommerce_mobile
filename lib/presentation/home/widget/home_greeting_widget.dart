import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../base/language/language.dart';

class HomeGreetingWidget extends StatefulWidget {
  const HomeGreetingWidget({super.key});

  @override
  State<HomeGreetingWidget> createState() => _HomeGreetingWidgetState();
}

class _HomeGreetingWidgetState extends State<HomeGreetingWidget> {
  late final UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = Get.find<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
        init: _userController,
        builder: (controller) {
          UserModel? userModel = _userController.userState.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Animate(
                    effects: const [FlipEffect(),],
                    child: Text(
                      MessageKeys.homeWelcomeTitle.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.mainColor),
                    ),
                  ),
                  if (userModel != null)
                    Animate(
                      effects: const [FlipEffect()],
                      child: Text(
                        " ${userModel.name}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16,),
            ],
          );
        });
  }
}
