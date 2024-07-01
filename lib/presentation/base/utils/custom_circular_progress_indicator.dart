import 'package:flutter/material.dart';

import '../style/colors.dart';

class CustomCircularProgressIndicator {
  static CircularProgressIndicator getIndicator(BuildContext context,Color? color) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.ceruleanBlueColor),
    );
  }
}
