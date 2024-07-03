// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) => SettingModel(
      phone: json['phone'] as String,
      facebookLink: json['facebookLink'] as String,
      instagramLink: json['instagramLink'] as String,
      deliveryTime: (json['deliveryTime'] as num).toInt(),
    );

Map<String, dynamic> _$SettingModelToJson(SettingModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'facebookLink': instance.facebookLink,
      'instagramLink': instance.instagramLink,
      'deliveryTime': instance.deliveryTime,
    };
