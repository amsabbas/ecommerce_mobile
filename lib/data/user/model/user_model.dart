import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phone")
  final String? phone;


  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
