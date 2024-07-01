import 'package:flutter/material.dart';

import '../utils/custom_circular_progress_indicator.dart';

Widget loadingWidget(BuildContext context, [dynamic data,Color? color]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: CustomCircularProgressIndicator.getIndicator(context,color),
    ),
  );
}
