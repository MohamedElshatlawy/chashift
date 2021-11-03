import 'package:json_annotation/json_annotation.dart'; 

part 'repair_payment_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RepairPaymentParams {
  @JsonKey(name: 'contractId')
  final  String? contractId;
  @JsonKey(name: 'transportaionId')
  final  String? transportaionId;
  @JsonKey(name: 'paymentType')
  final  String? paymentType;

  RepairPaymentParams({this.contractId, this.transportaionId, this.paymentType});

  factory RepairPaymentParams.fromJson(Map<String, dynamic> json) => _$RepairPaymentParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RepairPaymentParamsToJson(this);
}

