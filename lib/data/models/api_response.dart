import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  String? status;
  String? code;
  String? message;
  T? payload;

  bool isSuccessfully() => code == "200";

  ApiResponse({this.status, this.message, this.payload});
// T Function(Object? json) fromJsonT
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) toJsonT,
  ) =>
      _$ApiResponseFromJson(json, toJsonT);
}
