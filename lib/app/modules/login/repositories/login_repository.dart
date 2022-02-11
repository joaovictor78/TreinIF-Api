import 'package:dio/dio.dart';
import '/app/core/models/logged_user_model.dart';
import '/app/core/utils/return_data.dart';

import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/login/models/user_credentials_model.dart';

class LoginRepository {
  LoginRepository(this._httpClient);
  final IHttpClient _httpClient;

  Future<ReturnData<LoggedUserModel?>?> authenticate(
      UserCredentialsModel userCredentials) async {
    try {
      final Response response =
          await _httpClient.post("/login", data: userCredentials.toJson());
      return ReturnData(true, data: LoggedUserModel.fromMap(response.data));
    } catch (error) {
      if (error is DioError) {
        if (error.response!.statusCode == 401) {
          return ReturnData(false, message: "Email ou senha incorretos");
        }
      }
    }
  }
}
