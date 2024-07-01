// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaPaginatedModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseModelToJson(OrderResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
