import 'package:json_annotation/json_annotation.dart'; 

part 'create_contract_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CreateContractParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'addressId')
    int? addressId;
  @JsonKey(name: 'nationalityId')
  final  String? nationalityId;
  @JsonKey(name: 'cityId')
    String? cityId;
  @JsonKey(name: 'employeeId')
  final  String? employeeId;
  @JsonKey(name: 'offerPricingId')
  final  String? offerPricingId;

  CreateContractParams({this.id, this.addressId, this.nationalityId, this.cityId, this.employeeId, this.offerPricingId});

  factory CreateContractParams.fromJson(Map<String, dynamic> json) => _$CreateContractParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateContractParamsToJson(this);
}

