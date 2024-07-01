import 'package:ecommerce_mobile/data/orders/model/order_info_model.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_address_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "order_date")
  final String date;

  @JsonKey(name: "subtotal")
  final double subtotal;

  @JsonKey(name: "discount")
  final double discount;

  @JsonKey(name: "total")
  final double total;
  @JsonKey(name: "deliveryFees")
  final double deliveryFees;

  @JsonKey(name: "products")
  final List<ProductModel>? products;

  @JsonKey(name: "info")
  final List<OrderInfoModel>? info;

  @JsonKey(name: "user")
  final UserModel? userModel;

  @JsonKey(name: "user_address")
  final UserAddressModel? address;

  OrderModel({
    required this.id,
    required this.status,
    required this.date,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.deliveryFees,
    required this.products,
    required this.info,
    required this.userModel,
    required this.address,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
