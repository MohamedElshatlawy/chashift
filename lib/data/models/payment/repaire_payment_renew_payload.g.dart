// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repaire_payment_renew_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairePaymentRenewPayload _$RepairePaymentRenewPayloadFromJson(
    Map<String, dynamic> json) {
  return RepairePaymentRenewPayload(
    contractId: json['contractId'] as String?,
    offerPriceId: json['offerPriceId'] as String?,
    idNumber: json['idNumber'] as String?,
    paymentType: json['paymentType'] as String?,
  );
}

Map<String, dynamic> _$RepairePaymentRenewPayloadToJson(
        RepairePaymentRenewPayload instance) =>
    <String, dynamic>{
      'contractId': instance.contractId,
      'offerPriceId': instance.offerPriceId,
      'idNumber': instance.idNumber,
      'paymentType': instance.paymentType,
    };
