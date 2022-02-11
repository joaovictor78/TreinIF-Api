import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/course_entity.dart';

abstract class IGetAllCoursesRepository {
  Future<ReturnData<List<CourseEntity>>> call();
}
