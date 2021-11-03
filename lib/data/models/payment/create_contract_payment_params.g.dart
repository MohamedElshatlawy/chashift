// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contract_payment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContractPaymentParams _$CreateContractPaymentParamsFromJson(
    Map<String, dynamic> json) {
  return CreateContractPaymentParams(
    contractId: json['contractId'] as String?,
    transportaionId: json['transportaionId'] as String?,
    bankCheckOutId: json['bankCheckOutId'] as String?,
    resourcePath: json['resourcePath'] as String?,
    paymentType: json['paymentType'] as String?,
  );
}

Map<String, dynamic> _$CreateContractPaymentParamsToJson(
        CreateContractPaymentParams instance) =>
    <String, dynamic>{
      'contractId': instance.contractId,
      'transportaionId': instance.transportaionId,
      'bankCheckOutId': instance.bankCheckOutId,
      'resourcePath': instance.resourcePath,
      'paymentType': instance.paymentType,
    };
