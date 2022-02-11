import '/app/modules/add_exercises_to_workout/domain/i_repositories/i_get_exercies_types_repository.dart';

import '/app/core/utils/return_data.dart';

class GetExercisesTypesUseCase{
  GetExercisesTypesUseCase(this._iGetExercisesTypesRepository);
  IGetExercisesTypesRepository _iGetExercisesTypesRepository; 

  Future<ReturnData> call() async {
    return await _iGetExercisesTypesRepository();
  }
}