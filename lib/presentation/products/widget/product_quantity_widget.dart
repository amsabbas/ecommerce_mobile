import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/products/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductQuantityWidget extends StatefulWidget {
  final int productID;

  const ProductQuantityWidget({super.key, required this.productID});

  @override
  State<ProductQuantityWidget> createState() => _ProductQuantityWidgetState();
}

class _ProductQuantityWidgetState extends State<ProductQuantityWidget> {
  late final ProductsController _productsController;

  @override
  void initState() {
    super.initState();
    _productsController = Get.find(tag: widget.productID.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ProductsController>(
        init: _productsController,
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: OutlinedButton(
                  onPressed: () {
                    if (_productsController.quantity.value > 1) {
                      _productsController.quantity.value -= 1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.mainColor,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(_productsController.quantity.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.mainColor),
                  textAlign: TextAlign.start,
                  maxLines: 1),
              const SizedBox(width: 8),
              SizedBox(
                width: 30,
                height: 30,
                child: OutlinedButton(
                  onPressed: () {
                    _productsController.quantity.value += 1;
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.mainColor,
                    size: 15,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
