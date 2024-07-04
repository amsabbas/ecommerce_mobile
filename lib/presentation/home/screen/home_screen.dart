import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/error_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_ads_widget.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserController _userController;
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _userController = Get.find();
    _homeController = Get.find();
    _userController.getProfile();
    _homeController.getAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTopBarWidget(title:MessageKeys.appName.tr, showBackIcon: false,),
        body: GetX<HomeController>(
          init: _homeController,
          builder: (controller) => controller.adsState.handleStateInWidget(
              onSuccess: (context, data) => _successWidget(),
              onLoading: (context, data) => loadingWidget(context),
              onNormal: (context, data) => loadingWidget(context),
              onError: (context, data) => _errorWidget(),
              context: context),
        ));
  }

  Widget _successWidget() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeGreetingWidget(),
          HomeAdsWidget(),
        ],
      ),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: AppErrorWidget(retryCallback: () {
        _homeController.getAds();
      }),
    );
  }
}
