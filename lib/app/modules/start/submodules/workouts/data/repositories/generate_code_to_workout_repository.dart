import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_generate_code_to_workout_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_generate_code_to_workout_repository.dart';

class GenerateCodeToWorkoutRepository
    implements IGenerateCodeToWorkoutRepository {
  IGenerateCodeToWorkoutDataSource _iGenerateCodeToWorkoutDataSource;
  GenerateCodeToWorkoutRepository(this._iGenerateCodeToWorkoutDataSource);
  @override
  Future<ReturnData<CodeEntity>> call() {
    return _iGenerateCodeToWorkoutDataSource();
  }
}
