import 'package:json_annotation/json_annotation.dart';

part 'user_address_model.g.dart';

@JsonSerializable()
class UserAddressModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "street_name")
  final String? streetName;
  @JsonKey(name: "floor_no")
  final String? floorNo;
  @JsonKey(name: "building_no")
  final String? buildingNo;
  @JsonKey(name: "apartment_no")
  final String? apartmentNo;
  @JsonKey(name: "is_primary")
  final bool? isPrimary;
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lon")
  final double? lon;

  UserAddressModel({
    required this.id,
    required this.streetName,
    required this.floorNo,
    required this.buildingNo,
    required this.apartmentNo,
    required this.isPrimary,
    required this.lat,
    required this.lon,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressModelToJson(this);
}
