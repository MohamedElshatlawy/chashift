import 'package:json_annotation/json_annotation.dart'; 

part 'create_contract_payment_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CreateContractPaymentParams {
  @JsonKey(name: 'contractId')
  final  String? contractId;
  @JsonKey(name: 'transportaionId')
  final  String? transportaionId;
  @JsonKey(name: 'bankCheckOutId')
  final  String? bankCheckOutId;
  @JsonKey(name: 'resourcePath')
  final  String? resourcePath;
  @JsonKey(name: 'paymentType')
  final  String? paymentType;

  CreateContractPaymentParams({this.contractId, this.transportaionId, this.bankCheckOutId, this.resourcePath, this.paymentType});

  factory CreateContractPaymentParams.fromJson(Map<String, dynamic> json) => _$CreateContractPaymentParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateContractPaymentParamsToJson(this);
}

