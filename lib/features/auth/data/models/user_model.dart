import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String message;
  final int status;
  final UserData data;

  UserModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name:"f_name")
  final String fName;
   @JsonKey(name:"l_name")
  final String lName;
  final String email;
  final String phone;

  UserData({
    required this.token,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
