import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
