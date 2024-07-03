import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/asset_resource.dart';
import '../style/colors.dart';

class EmptyWidget extends StatelessWidget {
  final String message;

  const EmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetResource.noDataImagePath,
          width: 130,
          height: 130,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.ceruleanBlueColor),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
