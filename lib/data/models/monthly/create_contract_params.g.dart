// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contract_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContractParams _$CreateContractParamsFromJson(Map<String, dynamic> json) {
  return CreateContractParams(
    id: json['id'] as int?,
    addressId: json['addressId'] as int?,
    nationalityId: json['nationalityId'] as String?,
    cityId: json['cityId'] as String?,
    employeeId: json['employeeId'] as String?,
    offerPricingId: json['offerPricingId'] as String?,
  );
}

Map<String, dynamic> _$CreateContractParamsToJson(
        CreateContractParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressId': instance.addressId,
      'nationalityId': instance.nationalityId,
      'cityId': instance.cityId,
      'employeeId': instance.employeeId,
      'offerPricingId': instance.offerPricingId,
    };
