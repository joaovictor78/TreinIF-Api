import '/app/modules/manage_individual_workout/data/repositories/i_datasources/i_remove_exercise_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/domain/i_repositories/i_remove_exercise_repository.dart';

class RemoveExerciseRepository implements IRemoveExerciseRepository{
  IRemoveExerciseDataSource _iRemoveExerciseDataSource;
  RemoveExerciseRepository(this._iRemoveExerciseDataSource);
  @override
  Future<ReturnData> call(int workoutID, int exerciseID) async {
    return await _iRemoveExerciseDataSource(workoutID, exerciseID);
  }

}