import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/empty_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.mainColor,
            ),
            onPressed: () => Get.back(),
          ),
          title: AnimatedSearchBar(
              label: MessageKeys.search.tr,
              labelAlignment: Get.locale?.languageCode == "ar"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              controller: _homeController.searchController,
              labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.mainColor,
                  ),
              searchStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.mainColor,
                  ),
              cursorColor: AppColors.mainColor,
              textInputAction: TextInputAction.done,
              searchDecoration: InputDecoration(
                hintText: '',
                alignLabelWithHint: true,
                fillColor: AppColors.mainColor,
                focusColor: AppColors.mainColor,
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.mainColor,
                    ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  _homeController.searchProductsState
                      .setSuccess(List<ProductModel>.empty());
                }
              },
              onFieldSubmitted: (value) {
                _homeController.searchForProducts();
              })),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetX<HomeController>(
            init: _homeController,
            builder: (controller) {
              if (_homeController.searchProductsState.value.state ==
                  CurrentState.loading) {
                return loadingWidget(context);
              } else {
                List<ProductModel>? productResponseModel =
                    _homeController.searchProductsState.value.data;
                if (productResponseModel?.isEmpty == true) {
                  return Center(
                      child: EmptyWidget(
                          message: MessageKeys.emptyProductsTitle.tr));
                } else {
                  return ListView(
                    children: _getProductsWidget(productResponseModel),
                  );
                }
              }
            }),
      ),
    );
  }

  List<Widget> _getProductsWidget(List<ProductModel>? responseModel) {
    List<Widget> widgets = List.empty(growable: true);

    for (var element in responseModel ?? []) {
      widgets.add(ProductItemWidget(product: element));
    }
    return widgets;
  }
}
