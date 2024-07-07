import 'package:json_annotation/json_annotation.dart';

part 'cost_model.g.dart';

@JsonSerializable()
class CostModel {
  @JsonKey(name: "subtotal")
  final double subtotal;
  @JsonKey(name: "deliveryFees")
  final double deliveryFees;
  @JsonKey(name: "discount")
  final double discount;
  @JsonKey(name: "total")
  final double total;

  CostModel(
      {required this.subtotal,
      required this.deliveryFees,
      required this.discount,
      required this.total});

  factory CostModel.fromJson(Map<String, dynamic> json) =>
      _$CostModelFromJson(json);

  Map<String, dynamic> toJson() => _$CostModelToJson(this);
}
