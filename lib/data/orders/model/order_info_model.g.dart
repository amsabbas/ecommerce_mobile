// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) =>
    OrderInfoModel(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$OrderInfoModelToJson(OrderInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };
