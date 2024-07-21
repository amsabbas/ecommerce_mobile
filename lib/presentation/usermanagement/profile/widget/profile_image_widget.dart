import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AssetResource.accountUserImagePath,
          width: 100,
          height: 100,
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}
