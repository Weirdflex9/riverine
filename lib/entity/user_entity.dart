import 'package:riverine/generated/json/base/json_field.dart';
import 'package:riverine/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {

	String? name;
	int? id;
  String? email;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}