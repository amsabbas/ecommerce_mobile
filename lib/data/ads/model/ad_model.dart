import 'package:json_annotation/json_annotation.dart';

part 'ad_model.g.dart';

@JsonSerializable()
class AdModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "photo_url")
  final String photoUrl;

  AdModel({
    required this.id,
    required this.photoUrl,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdModelToJson(this);
}
