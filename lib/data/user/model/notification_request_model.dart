import 'package:json_annotation/json_annotation.dart';

part 'notification_request_model.g.dart';

@JsonSerializable()
class NotificationRequestModel {
  @JsonKey(name: "fcm_token")
  final String token;


  const NotificationRequestModel({required this.token});

  factory NotificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationRequestModelToJson(this);

}
