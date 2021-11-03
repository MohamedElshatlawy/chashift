// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_payment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairPaymentParams _$RepairPaymentParamsFromJson(Map<String, dynamic> json) {
  return RepairPaymentParams(
    contractId: json['contractId'] as String?,
    transportaionId: json['transportaionId'] as String?,
    paymentType: json['paymentType'] as String?,
  );
}

Map<String, dynamic> _$RepairPaymentParamsToJson(
        RepairPaymentParams instance) =>
    <String, dynamic>{
      'contractId': instance.contractId,
      'transportaionId': instance.transportaionId,
      'paymentType': instance.paymentType,
    };
