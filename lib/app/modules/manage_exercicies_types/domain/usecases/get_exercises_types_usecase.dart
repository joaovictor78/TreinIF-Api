import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_get_exercises_types_repository.dart';

class GetExercisesTypesUseCase{
  GetExercisesTypesUseCase(this._iGetExercisesTypesRepository);
  IGetExercisesTypesRepository _iGetExercisesTypesRepository; 

  Future<ReturnData> call() async {
    return await _iGetExercisesTypesRepository();
  }
}