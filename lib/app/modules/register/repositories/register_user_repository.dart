import 'dart:developer';

import '/app/core/models/course_model.dart';
import '/app/core/models/logged_user_model.dart';
import '/app/core/utils/return_data.dart';

import '/app/core/models/user_model.dart';
import '/app/core/network/interfaces/i_http_client.dart';

class RegisterUserRepository {
  RegisterUserRepository(this._client);
  final IHttpClient _client;

  Future<ReturnData<LoggedUserModel>?> registerUser(UserModel user) async {
    try {
      String dataJson = user.toJson();
      final response = await _client.post("/register", data: dataJson);
      return ReturnData(true, data: LoggedUserModel.fromMap(response.data));
    } catch (e) {
      return ReturnData(false, message: "Ocorreu um erro ao registrar o usuario");
    }
  }

  Future<ReturnData<List<CourseModel>>>? getAllCourses() async{
    try{
      final response = await _client.get("/courses");
      log(response.data.toString());
      List<CourseModel> listAllCourses = (response.data as List).map((course) => CourseModel.fromMap(course)).toList();
      return ReturnData(true, data: listAllCourses);
    }catch(e){
      return ReturnData(false, message: "Ocorreu um erro ao listas todos os cursos");
    }
  }
}
