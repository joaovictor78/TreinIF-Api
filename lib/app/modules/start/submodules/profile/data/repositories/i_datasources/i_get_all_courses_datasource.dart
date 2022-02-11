import '/app/domain/entitities/course_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IGetAllCoursesDataSource {
  Future<ReturnData<List<CourseEntity>>> call();
}
