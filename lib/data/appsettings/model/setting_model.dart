import 'package:json_annotation/json_annotation.dart';

part 'setting_model.g.dart';

@JsonSerializable()
class SettingModel {
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "facebookLink")
  final String facebookLink;
  @JsonKey(name: "instagramLink")
  final String instagramLink;
  @JsonKey(name: "deliveryTime")
  final int deliveryTime;

  SettingModel({
    required this.phone,
    required this.facebookLink,
    required this.instagramLink,
    required this.deliveryTime,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingModelToJson(this);
}
