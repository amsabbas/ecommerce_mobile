// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      addressId: (json['id'] as num).toInt(),
      streetName: json['street_name'] as String,
      floorNo: json['floor_no'] as String,
      buildingNo: json['building_no'] as String,
      apartmentNo: json['apartment_no'] as String,
      isDefault: json['is_primary'] as bool,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      areaModel: AreaModel.fromJson(json['area'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.addressId,
      'street_name': instance.streetName,
      'floor_no': instance.floorNo,
      'building_no': instance.buildingNo,
      'apartment_no': instance.apartmentNo,
      'is_primary': instance.isDefault,
      'lat': instance.lat,
      'lon': instance.lon,
      'area': instance.areaModel,
    };
