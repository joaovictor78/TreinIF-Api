import 'dart:convert';

import '/app/core/enums/user_types_enum.dart';

class UserModel {
  int? id;
  String? fullName;
  String? email;
  String? profileAvatarURL;
  String? password;
  UserTypesEnum? userType;
  UserModel(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.profileAvatarURL,
      this.userType});
  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
      'avatar_url': profileAvatarURL,
      'role': userType!.code
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      fullName: map['full_name'],
      email: map['email'],
      profileAvatarURL: map['avatar_url'],
      userType: map["role"] == UserTypesEnum.athlete.code
          ? UserTypesEnum.athlete
          : UserTypesEnum.trainer,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
