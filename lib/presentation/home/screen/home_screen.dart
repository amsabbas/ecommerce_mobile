import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/error_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:ecommerce_mobile/presentation/home/screen/home_container_screen.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_ads_widget.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_categories_widget.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_greeting_widget.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_products_widget.dart';
import 'package:ecommerce_mobile/presentation/notification/model/notification_type_route.dart';
import 'package:ecommerce_mobile/presentation/notification/notification_controller.dart';
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
  late final NotificationController _notificationController;
  late final Worker _userWorker;

  @override
  void initState() {
    super.initState();
    _notificationController = Get.find();
    _userController = Get.find();
    _homeController = Get.find();
    _userController.getProfile();
    _homeController.getHomeData();
    _userController.refreshProductQuantity();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notificationController.configure();
    });
    _userWorker = ever(_userController.userState, (value) {
      if (value != null) {
        _sendPushNotification();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTopBarWidget(
          title: MessageKeys.appName.tr,
          showBackIcon: false,
        ),
        body: GetX<HomeController>(
          init: _homeController,
          builder: (controller) => controller.homeState.handleStateInWidget(
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeGreetingWidget(),
          HomeAdsWidget(),
          HomeCategoriesWidget(),
          Expanded(child: HomeProductsWidget()),
        ],
      ),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: AppErrorWidget(retryCallback: () {
        _homeController.getHomeData();
      }),
    );
  }

  void _sendPushNotification() {
    _observeOnNotificationData();
    _notificationController.sendPushNotificationToken();
  }

  void _observeOnNotificationData() {
    ever(_notificationController.notificationData, (value) {
      _checkNotificationData();
    });
    _checkNotificationData();
  }

  void _checkNotificationData() {
    switch (_notificationController.notificationData.value.route) {
      case NotificationTypeNavigateRoutes.home:
        Get.to(() => const HomeContainerScreen());
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userWorker.dispose();
  }
}
