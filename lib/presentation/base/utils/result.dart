import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

enum CurrentState { loading, success, error, empty }

//ignore: must_be_immutable
class ResultData<Type> {
  CurrentState state = CurrentState.empty;
  Type? data;
  Object? error;

  ResultData({this.data, this.error});

  void handleState(
      {Function? onLoading,
      Function? onError,
      Function? onSuccess,
      Function? onLoadingFinish}) {
    if (onLoading != null && state == CurrentState.loading) {
      onLoading();
    }
    if (onSuccess != null && state == CurrentState.success) {
      if (onLoadingFinish != null) {
        onLoadingFinish();
      }
      onSuccess();
    }
    if (onError != null && state == CurrentState.error) {
      if (onLoadingFinish != null) {
        onLoadingFinish();
      }
      onError();
    }
  }
}

class ResultState<Type> extends Rx<ResultData> {
  ResultState() : super(ResultData<Type>());

  void resetState() {
    value.data = null;
    value.error = null;
    _setState(CurrentState.empty);
  }

  void setLoading() {
    _setState(CurrentState.loading);
  }

  void setSuccess(Type data) {
    value.data = data;
    value.error = null;
    _setState(CurrentState.success);
  }

  void setError(Object error) {
    value.data = null;
    value.error = error;
    _setState(CurrentState.error);
  }

  void _setState(CurrentState newState) {
    value.state = newState;
    refresh();
  }

  CurrentState get state {
    return value.state;
  }

  Widget handleStateInWidget(
      {Function(BuildContext, dynamic)? onSuccess,
      Function(BuildContext, dynamic)? onError,
      Function(BuildContext, dynamic)? onLoading,
      required Function(BuildContext, dynamic) onNormal,
      Function? onLoadingFinish,
      required BuildContext context}) {
    var resultData = value;

    Widget suggestedWidget = onNormal(context, resultData.data);

    if (resultData.state == CurrentState.success && onSuccess != null) {
      suggestedWidget = onSuccess(context, resultData.data);
    } else if (resultData.state == CurrentState.error && onError != null) {
      suggestedWidget = onError(context, resultData.error);
    } else if (resultData.state == CurrentState.loading && onLoading != null) {
      suggestedWidget = onLoading(context, resultData.data);
    }
    if ((resultData.state == CurrentState.success ||
            resultData.state == CurrentState.error) &&
        onLoadingFinish != null) {
      onLoadingFinish();
    }

    return suggestedWidget;
  }
}
