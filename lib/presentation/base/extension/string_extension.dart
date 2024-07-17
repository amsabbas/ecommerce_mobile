import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../language/language.dart';

extension StringExtension on String? {
  String isAvailable() {
    if (this == "true") {
      return MessageKeys.yes.tr;
    } else {
      return MessageKeys.no.tr;
    }
  }

  String getStatus() {
    if (this == pendingStatus) {
      return MessageKeys.pending.tr;
    } else if (this == acceptedStatus) {
      return MessageKeys.accepted.tr;
    } else {
      return MessageKeys.rejected.tr;
    }
  }

  String getPayment() {
    if (this == "cash") {
      return MessageKeys.cash.tr;
    } else {
      return MessageKeys.visa.tr;
    }
  }

  Color getStatusColor() {
    if (this == pendingStatus) {
      return AppColors.orangeColor;
    } else if (this == acceptedStatus) {
      return AppColors.greenColor;
    } else {
      return AppColors.redColor;
    }
  }
}
