import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "quantity")
  final int quantity;
  @JsonKey(name: "product")
  final ProductModel product;

  CartModel({required this.id, required this.quantity, required this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
