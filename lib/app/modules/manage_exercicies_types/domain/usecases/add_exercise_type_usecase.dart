import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_add_exercise_type_repository.dart';

class AddExerciseTypeUseCase {
  IAddExerciseTypeRepository _addExerciseTypeRepository;
  AddExerciseTypeUseCase(this._addExerciseTypeRepository);

  Future<ReturnData> call(String exerciseTypeName) async {
    return await _addExerciseTypeRepository(exerciseTypeName);
  }
}