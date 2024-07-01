
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserController userController;

  @override
  void initState() {
    super.initState();
    userController = Get.find();
    userController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }


}
