import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_remove_exercise_type_repository.dart';

class RemoveExerciseTypeUseCase{
  RemoveExerciseTypeUseCase(this._iRemoveExerciseTypeRepository);
  IRemoveExerciseTypeRepository _iRemoveExerciseTypeRepository;

  Future<ReturnData> call(int id) async {
     return await _iRemoveExerciseTypeRepository(id);
  }
}