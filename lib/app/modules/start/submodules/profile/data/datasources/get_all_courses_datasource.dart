import '/app/modules/start/submodules/profile/data/dtos/course_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/course_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/data/repositories/i_datasources/i_get_all_courses_datasource.dart';

class GetAllCoursesDataSource implements IGetAllCoursesDataSource {
  GetAllCoursesDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<CourseEntity>>> call() async {
    try {
      final courses = await _client.get("/courses");
      List<CourseEntity> list = (courses as List)
          .map((element) => CourseDTO.fromMap(element))
          .toList();
      return ReturnData(true, data: list);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
