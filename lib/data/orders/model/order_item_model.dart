import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel {
  @JsonKey(name: "quantity")
  final int quantity;

  @JsonKey(name: "product")
  final ProductModel product;

  OrderItemModel({
    required this.quantity,
    required this.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}
