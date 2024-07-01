// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
      id: (json['id'] as num).toInt(),
      photoUrl: json['photo_url'] as String,
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
      'id': instance.id,
      'photo_url': instance.photoUrl,
    };
