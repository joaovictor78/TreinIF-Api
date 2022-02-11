import '/app/modules/manage_individual_workout/domain/i_repositories/i_remove_exercise_repository.dart';
import '/app/core/utils/return_data.dart';

class RemoveExerciseUseCase{
  IRemoveExerciseRepository _iRemoveExerciseRepository;
  RemoveExerciseUseCase(this._iRemoveExerciseRepository);
  Future<ReturnData> call(int workoutID, int exerciseID) async{
    return await _iRemoveExerciseRepository(workoutID, exerciseID);
  }
}