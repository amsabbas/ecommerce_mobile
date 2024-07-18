import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../style/colors.dart';

class CustomCircularProgressIndicator {
  static SpinKitThreeBounce getIndicator(BuildContext context, Color? color) {
    return SpinKitThreeBounce(
      color: color ?? AppColors.mainColor,
      size: 20.0,
    );
  }
}
