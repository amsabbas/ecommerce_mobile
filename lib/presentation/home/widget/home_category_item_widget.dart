import 'package:ecommerce_mobile/data/categories/model/category_model.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryItemWidget extends StatefulWidget {
  final CategoryModel category;

  const HomeCategoryItemWidget({super.key, required this.category});

  @override
  State<HomeCategoryItemWidget> createState() => _HomeCategoryItemWidgetState();
}

class _HomeCategoryItemWidgetState extends State<HomeCategoryItemWidget> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _homeController.setSelectedCategoryID(widget.category.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
        child: Column(
          children: [
            GetX<HomeController>(
                init: _homeController,
                builder: (controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: _homeController.selectedCategory.value ==
                              widget.category.id
                          ? AppColors.blackColor
                          : AppColors.darkGrayColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 2),
                      child: Text(
                        widget.category.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
