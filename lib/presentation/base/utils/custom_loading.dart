import 'package:flutter/material.dart';

import '../widget/loading_widget.dart';

class CustomLoading {
  static DialogState _dialogState = DialogState.none;

  static void dismissLoading(BuildContext context) {
    if (_dialogState == DialogState.shown) {
      _dialogState = DialogState.hidden;
      Navigator.pop(context);
    }
  }

  static void onLoading(BuildContext context, [Color? color]) async {
    _dialogState = DialogState.shown;

    showDialog(
      barrierColor: Colors.black.withOpacity(0.02),
      barrierDismissible: false,
      builder: (ctx) {
        return PopScope(
            onPopInvoked: (value) async {
              _dialogState = DialogState.hidden;
            },
            child: loadingWidget(context, context, color));
      },
      context: context,
    );
  }
}

enum DialogState { none, shown, hidden }
