import 'package:json_annotation/json_annotation.dart'; 

part 'complete_renew_payment.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CompleteRenewPayment {
  @JsonKey(name: 'contractId')
  String? contractId;
  @JsonKey(name: 'offerPriceId')
  String? offerPriceId;
  @JsonKey(name: 'bankCheckOutId')
  String? bankCheckOutId;
  @JsonKey(name: 'resourcePath')
  String? resourcePath;
  @JsonKey(name: 'paymentType')
  String? paymentType;

  CompleteRenewPayment({this.contractId, this.offerPriceId, this.bankCheckOutId, this.resourcePath, this.paymentType});

  factory CompleteRenewPayment.fromJson(Map<String, dynamic> json) => _$CompleteRenewPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteRenewPaymentToJson(this);
}

