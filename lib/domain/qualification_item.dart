import 'package:json_annotation/json_annotation.dart'; 

part 'qualification_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class QualificationItem {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'qualificationName')
  final  String? qualificationName;

  QualificationItem({this.id, this.qualificationName});

  factory QualificationItem.fromJson(Map<String, dynamic> json) => _$QualificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationItemToJson(this);
}

