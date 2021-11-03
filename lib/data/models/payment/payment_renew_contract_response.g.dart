// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_renew_contract_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRenewContractResponse _$PaymentRenewContractResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentRenewContractResponse(
    paymentArchieveId: json['paymentArchieveId'] as int?,
    contractCreatedId: json['contractCreatedId'] as String?,
  );
}

Map<String, dynamic> _$PaymentRenewContractResponseToJson(
        PaymentRenewContractResponse instance) =>
    <String, dynamic>{
      'paymentArchieveId': instance.paymentArchieveId,
      'contractCreatedId': instance.contractCreatedId,
    };
