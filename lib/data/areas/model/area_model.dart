import 'package:json_annotation/json_annotation.dart';

part 'area_model.g.dart';

@JsonSerializable()
class AreaModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  AreaModel({
    required this.id,
    required this.name,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) =>
      _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}
