import 'dart:convert';

class TokenModel {
  String? acessToken;
  String? refreshToken;
  TokenModel({this.acessToken, this.refreshToken});
  Map<String, dynamic> toMap() {
    return {
      'acess_token': acessToken,
      'refresh_token': refreshToken
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      acessToken: map['acess_token'],
      refreshToken: map['refresh_token']
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) => TokenModel.fromMap(json.decode(source));
}
