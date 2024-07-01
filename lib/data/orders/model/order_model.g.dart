// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      date: json['order_date'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      deliveryFees: (json['deliveryFees'] as num).toDouble(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: (json['info'] as List<dynamic>?)
          ?.map((e) => OrderInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userModel: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      address: json['user_address'] == null
          ? null
          : UserAddressModel.fromJson(
              json['user_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'order_date': instance.date,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'total': instance.total,
      'deliveryFees': instance.deliveryFees,
      'products': instance.products,
      'info': instance.info,
      'user': instance.userModel,
      'user_address': instance.address,
    };
