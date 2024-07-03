import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/widget/empty_app_bar.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/screen/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../base/language/language.dart';
import '../../base/model/asset_resource.dart';
import 'home_screen.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({super.key});

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: _getSelectedScreen(),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          indicatorColor: AppColors.black12,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIndex: _currentPage,
          destinations: _getNavigationWidget()),
    );
  }

  List<Widget> _getNavigationWidget() {
    return <NavigationDestination>[
      NavigationDestination(
        icon: SvgPicture.asset(
          AssetResource.homeImagePath,
          width: 20,
          height: 20,
        ),
        label: MessageKeys.homeTitle.tr,
      ),
      NavigationDestination(
        icon: SvgPicture.asset(
          AssetResource.homeOrdersImagePath,
          width: 20,
          height: 20,
        ),
        label: MessageKeys.ordersTitle.tr,
      ),
      NavigationDestination(
        icon: SvgPicture.asset(
          AssetResource.homeAccountImagePath,
          width: 20,
          height: 20,
        ),
        label: MessageKeys.accountTitle.tr,
      ),
    ];
  }

  Widget _getSelectedScreen() {
    switch (_currentPage) {
      case 0:
        return const HomeScreen();
      case 1:
        return const HomeScreen();
      default:
        return const AccountScreen();
    }
  }
}
