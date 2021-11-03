import 'package:json_annotation/json_annotation.dart'; 

part 'payment_renew_contract_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PaymentRenewContractResponse {
  @JsonKey(name: 'paymentArchieveId')
  final  int? paymentArchieveId;
  @JsonKey(name: 'contractCreatedId')
  final  String? contractCreatedId;

  PaymentRenewContractResponse({this.paymentArchieveId, this.contractCreatedId});

  factory PaymentRenewContractResponse.fromJson(Map<String, dynamic> json) => _$PaymentRenewContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRenewContractResponseToJson(this);
}

