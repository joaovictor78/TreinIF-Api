import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_update_exercise_type_repository.dart';

class UpdateExerciseTypeUseCase{
   IUpdateExerciseTypeRepository _iUpdateExerciseTypeRepository;
   UpdateExerciseTypeUseCase(this._iUpdateExerciseTypeRepository);

   Future<ReturnData> call(int id, String exerciseTypeName) async {
     return await _iUpdateExerciseTypeRepository(id, exerciseTypeName);
   }
}