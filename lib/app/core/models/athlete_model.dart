import 'dart:convert';
import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/user_model.dart';

class AthleteModel extends UserModel {
  String? course;
  int? courseId;
  String? cpf;
  String? rg;
  String? bloodType;
  String? birthdate;
  String? fullName;
  String? email;
  String? password;
  String? profileAvatarURL;
  UserTypesEnum? userType;
  AthleteModel(
      {this.email,
      this.fullName,
      this.profileAvatarURL,
      this.userType,
      this.course,
      this.password,
      this.birthdate,
      this.courseId,
      this.bloodType,
      this.cpf,
      this.rg})
      : super(
            email: email,
            fullName: fullName,
            userType: userType,
            password: password,
            profileAvatarURL: profileAvatarURL);
  Map<String, dynamic> toMap() {
    return {
      'course_id': courseId,
      'CPF': cpf,
      'RG': rg,
      'blood_type': bloodType,
      'birth_date': birthdate,
      ...super.toMap()
    };
  }

  @override
  factory AthleteModel.fromMap(Map<String, dynamic> map) {
    return AthleteModel(
      course: map['course'],
      cpf: map['cpf'],
      rg: map['rg'],
      bloodType: map['bloodType'],
      birthdate: map['birthdate'],
      email: map['email'],
      fullName: map['fullName'],
      profileAvatarURL: map['prifleAvatarURL'],
      userType: map["role_id"] == UserTypesEnum.athlete.code
          ? UserTypesEnum.athlete
          : UserTypesEnum.trainer,
    );
  }

  String toJson() => json.encode(toMap());

  factory AthleteModel.fromJson(String source) =>
      AthleteModel.fromMap(json.decode(source));
}
