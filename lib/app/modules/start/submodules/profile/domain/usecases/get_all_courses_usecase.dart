import '/app/domain/entitities/course_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/domain/i_repositories/i_get_all_couses_repository.dart';

class GetAllCoursesUseCase {
  GetAllCoursesUseCase(this._iGetAllCoursesRepository);
  final IGetAllCoursesRepository _iGetAllCoursesRepository;
  Future<ReturnData<List<CourseEntity>>> call() async {
    return await _iGetAllCoursesRepository();
  }
}
