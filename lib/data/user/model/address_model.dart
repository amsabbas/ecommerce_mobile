import 'package:ecommerce_mobile/data/areas/model/area_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {

  @JsonKey(name: "id")
  final int addressId;
  @JsonKey(name: "street_name")
  final String streetName;
  @JsonKey(name: "floor_no")
  final String floorNo;
  @JsonKey(name: "building_no")
  final String buildingNo;
  @JsonKey(name: "apartment_no")
  final String apartmentNo;
  @JsonKey(name: "is_primary")
  final bool isDefault;

  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lon")
  final double lon;
  @JsonKey(name: "area")
  final AreaModel areaModel;

  AddressModel({
      required this.addressId,
      required this.streetName,
      required this.floorNo,
      required this.buildingNo,
      required this.apartmentNo,
      required this.isDefault,
      required this.lat,
      required this.lon,
      required this.areaModel,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
