// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostModel _$CostModelFromJson(Map<String, dynamic> json) => CostModel(
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFees: (json['deliveryFees'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$CostModelToJson(CostModel instance) => <String, dynamic>{
      'subtotal': instance.subtotal,
      'deliveryFees': instance.deliveryFees,
      'discount': instance.discount,
      'total': instance.total,
    };
