import 'package:json_annotation/json_annotation.dart';

part 'order_info_model.g.dart';

@JsonSerializable()
class OrderInfoModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "quantity")
  final int quantity;


  OrderInfoModel({
    required this.id,
    required this.quantity,
  });

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInfoModelToJson(this);
}
