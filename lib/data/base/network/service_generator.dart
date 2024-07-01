import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../../appsettings/datasource/local/settings_local_data_source.dart';
import '../model/app_error_model.dart';
import '../utils/app_logger.dart';
import '../utils/auth_manager.dart';
import '../utils/end_point.dart';

class ServiceGenerator {
  late final Dio _dio;
  late final String _baseUrl;
  late final AuthManager _authManager;
  late final SettingsLocalDataSource localDataSource;


  ServiceGenerator(this._baseUrl, this._authManager, this.localDataSource) {
    createDio();
  }

  createDio() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }
  }

  Future<M> call<M>(EndPoint endPoint) async {
    endPoint.headers!["Accept-Language"] = localDataSource.getLanguage();
    _dio.options.headers = endPoint.headers;

    try {
      final response = await _dio.request(endPoint.endpoint,
          data: endPoint.type == HttpType.formData
              ? endPoint.data != null
                  ? FormData.fromMap(endPoint.data!)
                  : null
              : endPoint.data,
          queryParameters:
              endPoint.method == HttpMethod.get ? endPoint.data : null,
          options: Options(method: endPoint.method.toShortString()));
      return response.data;
    } on DioException catch (e, s) {
      AppLogger.error(errorStack: s, error: e);
      throw _handleError(e);
    }
  }

  AppErrorModel _handleError(DioException error) {
    var appError = AppErrorModel(error.message);
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        if (error.error is TlsException) {
          appError.type = ErrorType.certificateError;
        } else {
          appError.type = ErrorType.network;
        }
        break;

      case DioExceptionType.badResponse:
        var response = error.response;
        appError.code = error.response?.statusCode;
        if (response!.statusCode == 401) {
          appError.type = ErrorType.unauthorized;
          _authManager.deleteUser();
        } else {
          appError.type = ErrorType.api;
          appError.message = _handleServerErrorMessage(response);
        }
        break;

      default:
        break;
    }
    return appError;
  }

  String? _handleServerErrorMessage(Response? response) {
    String? message;

    if (response == null || response.data == null) {
      return message;
    }
    if (response.data! is Map<String, dynamic>) {
      if ((response.data! as Map<String, dynamic>)["message"] != null) {
        return response.data['message'];
      }
    }
    return message;
  }
}
