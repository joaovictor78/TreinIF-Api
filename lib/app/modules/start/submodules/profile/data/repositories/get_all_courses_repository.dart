import '/app/modules/start/submodules/profile/data/repositories/i_datasources/i_get_all_courses_datasource.dart';
import '/app/domain/entitities/course_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/domain/i_repositories/i_get_all_couses_repository.dart';

class GetAllCoursesRepository implements IGetAllCoursesRepository {
  GetAllCoursesRepository(this._iGetAllCoursesDataSource);
  final IGetAllCoursesDataSource _iGetAllCoursesDataSource;
  @override
  Future<ReturnData<List<CourseEntity>>> call() async {
    return await _iGetAllCoursesDataSource();
  }
}
