import 'package:json_annotation/json_annotation.dart'; 

part 'repaire_payment_renew_payload.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RepairePaymentRenewPayload {
  @JsonKey(name: 'contractId')
  String? contractId;
  @JsonKey(name: 'offerPriceId')
  String? offerPriceId;
  @JsonKey(name: 'idNumber')
  String? idNumber;
  @JsonKey(name: 'paymentType')
  String? paymentType;

  RepairePaymentRenewPayload({this.contractId, this.offerPriceId, this.idNumber, this.paymentType});

  factory RepairePaymentRenewPayload.fromJson(Map<String, dynamic> json) => _$RepairePaymentRenewPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RepairePaymentRenewPayloadToJson(this);
}

