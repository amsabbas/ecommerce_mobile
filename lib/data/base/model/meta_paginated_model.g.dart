// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_paginated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaPaginatedModel _$MetaPaginatedModelFromJson(Map<String, dynamic> json) =>
    MetaPaginatedModel(
      page: (json['page'] as num).toInt(),
      take: (json['take'] as num).toInt(),
      itemCount: (json['itemCount'] as num).toInt(),
      pageCount: (json['pageCount'] as num).toInt(),
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$MetaPaginatedModelToJson(MetaPaginatedModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'take': instance.take,
      'itemCount': instance.itemCount,
      'pageCount': instance.pageCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };
