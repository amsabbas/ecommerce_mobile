import 'package:ecommerce_mobile/data/categories/model/category_model.dart';
import 'package:ecommerce_mobile/presentation/home/widget/home_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key});

  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = _homeController.categoriesState.value.data;
    if (categories.isEmpty) {
      return Container();
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            return HomeCategoryItemWidget(category: categories[index]);
          }),
        ),
      );
    }
  }
}
