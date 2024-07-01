import 'package:ecommerce_mobile/data/categories/model/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "photo_url")
  final String? photoUrl;
  @JsonKey(name: "category")
  final CategoryModel? category;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "is_available")
  final bool? isAvailable;
  @JsonKey(name: "price")
  final double? price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.category,
    required this.quantity,
    required this.isAvailable,
    required this.categoryId,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
