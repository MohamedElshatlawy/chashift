// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_renew_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteRenewPayment _$CompleteRenewPaymentFromJson(Map<String, dynamic> json) {
  return CompleteRenewPayment(
    contractId: json['contractId'] as String?,
    offerPriceId: json['offerPriceId'] as String?,
    bankCheckOutId: json['bankCheckOutId'] as String?,
    resourcePath: json['resourcePath'] as String?,
    paymentType: json['paymentType'] as String?,
  );
}

Map<String, dynamic> _$CompleteRenewPaymentToJson(
        CompleteRenewPayment instance) =>
    <String, dynamic>{
      'contractId': instance.contractId,
      'offerPriceId': instance.offerPriceId,
      'bankCheckOutId': instance.bankCheckOutId,
      'resourcePath': instance.resourcePath,
      'paymentType': instance.paymentType,
    };
