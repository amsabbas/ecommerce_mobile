import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeProductsWidget extends StatefulWidget {
  const HomeProductsWidget({super.key});

  @override
  State<HomeProductsWidget> createState() => _HomeProductsWidgetState();
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
              return ListView.builder(
                  itemCount: productResponseModel!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: FadeInAnimation(
                        child: ProductItemWidget(
                            product: productResponseModel[index]),
                      ),
                    );
                  });
            }
          }
        });
  }
}
