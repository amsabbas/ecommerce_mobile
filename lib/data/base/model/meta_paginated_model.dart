import 'package:json_annotation/json_annotation.dart';

part 'meta_paginated_model.g.dart';

@JsonSerializable()
class MetaPaginatedModel {
  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "take")
  final int take;

  @JsonKey(name: "itemCount")
  final int itemCount;

  @JsonKey(name: "pageCount")
  final int pageCount;

  @JsonKey(name: "hasPreviousPage")
  final bool hasPreviousPage;

  @JsonKey(name: "hasNextPage")
  final bool hasNextPage;

  MetaPaginatedModel({
    required this.page,
    required this.take,
    required this.itemCount,
    required this.pageCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory MetaPaginatedModel.fromJson(Map<String, dynamic> json) =>
      _$MetaPaginatedModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaPaginatedModelToJson(this);
}
