import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_generate_code_to_workout_repository.dart';

class GenerateCodeToWorkoutUseCase {
  GenerateCodeToWorkoutUseCase(this._iGenerateCodeToWorkoutRepository);
  IGenerateCodeToWorkoutRepository _iGenerateCodeToWorkoutRepository;
  Future<ReturnData<CodeEntity>> call() async {
    return await _iGenerateCodeToWorkoutRepository();
  }
}
