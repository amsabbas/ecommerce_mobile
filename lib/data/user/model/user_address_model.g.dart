// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) =>
    UserAddressModel(
      id: (json['id'] as num?)?.toInt(),
      streetName: json['street_name'] as String?,
      floorNo: json['floor_no'] as String?,
      buildingNo: json['building_no'] as String?,
      apartmentNo: json['apartment_no'] as String?,
      isPrimary: json['is_primary'] as bool?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserAddressModelToJson(UserAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street_name': instance.streetName,
      'floor_no': instance.floorNo,
      'building_no': instance.buildingNo,
      'apartment_no': instance.apartmentNo,
      'is_primary': instance.isPrimary,
      'lat': instance.lat,
      'lon': instance.lon,
    };
