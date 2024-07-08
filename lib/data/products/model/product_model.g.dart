// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photo_url'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
      isAvailable: json['is_available'] as bool?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      nameAr: json['name_ar'] as String?,
      descriptionAr: json['description_ar'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_ar': instance.nameAr,
      'description': instance.description,
      'description_ar': instance.descriptionAr,
      'photo_url': instance.photoUrl,
      'category': instance.category,
      'category_id': instance.categoryId,
      'quantity': instance.quantity,
      'is_available': instance.isAvailable,
      'price': instance.price,
    };
