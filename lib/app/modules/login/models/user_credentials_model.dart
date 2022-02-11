import 'dart:convert';

class UserCredentialsModel {
  String? email;
  String? password;
  UserCredentialsModel(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserCredentialsModel.fromMap(Map<String, dynamic> map) {
    return UserCredentialsModel(
      map['email'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCredentialsModel.fromJson(String source) => UserCredentialsModel.fromMap(json.decode(source));
}
