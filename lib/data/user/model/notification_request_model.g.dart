// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequestModel _$NotificationRequestModelFromJson(
        Map<String, dynamic> json) =>
    NotificationRequestModel(
      token: json['fcm_token'] as String,
    );

Map<String, dynamic> _$NotificationRequestModelToJson(
        NotificationRequestModel instance) =>
    <String, dynamic>{
      'fcm_token': instance.token,
    };
