import 'package:ecommerce_mobile/data/base/model/meta_paginated_model.dart';
import 'package:ecommerce_mobile/data/orders/model/order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class OrderResponseModel {
  @JsonKey(name: "data")
  final List<OrderModel> data;

  @JsonKey(name: "meta")
  final MetaPaginatedModel meta;


  OrderResponseModel({
    required this.data,
    required this.meta,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseModelToJson(this);
}
