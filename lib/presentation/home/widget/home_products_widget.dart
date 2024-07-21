import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeProductsWidget extends StatefulWidget {
  const HomeProductsWidget({super.key});

  @override
  State<HomeProductsWidget> createState() =>
      _HomeProductsWidgetState();
}

class _HomeProductsWidgetState extends State<HomeProductsWidget> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        init: _homeController,
        builder: (controller) {
          if (_homeController.productsState.value.state ==
              CurrentState.loading) {
            return loadingWidget(context);
          } else {
            List<ProductModel>? productResponseModel =
                _homeController.productsState.value.data;
            if (productResponseModel?.isEmpty == true) {
              return Container();
            } else {
              return ListView(
                children: _getProductsWidget(productResponseModel),
              );
            }
          }
        });
  }

  List<Widget> _getProductsWidget(List<ProductModel>? responseModel) {
    List<Widget> widgets = List.empty(growable: true);

    for (var element in responseModel ?? []) {
      widgets.add(ProductItemWidget(product: element));
    }
    return widgets;
  }
}
