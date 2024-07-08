import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_mobile/data/ads/model/ad_model.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeAdsWidget extends StatefulWidget {
  const HomeAdsWidget({super.key});

  @override
  State<HomeAdsWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeAdsWidget> {
  final PageController _pageController = PageController();
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    List<AdModel>? result = _homeController.adsState.value.data;
    if (result?.isEmpty == true) {
      return Container();
    } else {
      return Column(
        children: [
          SizedBox(
            height: 150.0,
            child: PageView(
                controller: _pageController,
                children: _getImageWidgets(result)),
          ),
          const SizedBox(height: 8),
          _buildPageIndicator(result),
        ],
      );
    }
  }

  List<Widget> _getImageWidgets(List<AdModel>? responseModel) {
    List<Widget> widgets = List.empty(growable: true);

    for (var element in responseModel ?? []) {
      String photoUrl = element.photoUrl;

      widgets.add(CachedNetworkImage(
          imageUrl:
              "$baseURL${photoUrl.replaceAll("localhost:3000/", "")}",
          // "$scheme://" + element.photoUrl,
          height: 150.0,
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (context, url) =>
              Image.asset(AssetResource.homeAdsPlaceholderImagePath)));
    }

    return widgets;
  }

  Widget _buildPageIndicator(List<AdModel>? responseModel) {
    int? length = responseModel?.length ?? 0;
    return Center(
      child: SmoothPageIndicator(
        controller: _pageController,
        count: length ?? 0, // Replace with the actual number of images
        effect: const WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          type: WormType.thin,
          activeDotColor: AppColors.mainColor,
          dotColor: AppColors.darkGrayColor,
        ),
      ),
    );
  }
}
