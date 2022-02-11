import 'dart:convert';

import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/athlete_model.dart';

import '/app/core/models/user_model.dart';

import '/app/core/models/token_model.dart';

class LoggedUserModel {
  UserModel? user;
  TokenModel? token;

  LoggedUserModel({this.user, this.token});
  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'token': token,
    };
  }

  factory LoggedUserModel.fromMap(Map<String, dynamic> map) {
    return LoggedUserModel(
      user: map['user'] == null
          ? null
          : map["user"]["role_id"] == UserTypesEnum.athlete.code
              ? AthleteModel.fromMap(map['user'])
              : UserModel.fromMap(map['user']),
      token: map['token'] != null ? TokenModel.fromMap(map['token']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserModel.fromJson(String source) =>
      LoggedUserModel.fromMap(json.decode(source));
}
