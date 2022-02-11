import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/add_exercises_to_workout/data/repositories/i_datasources/i_add_exercise_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/add_exercises_to_workout/domain/i_repositories/i_add_exercise_repository.dart';

class AddExerciseRepository implements IAddExerciseRepository{
  IAddExerciseDataSource _iAddExerciseDataSource;
  AddExerciseRepository(this._iAddExerciseDataSource);
  @override
  Future<ReturnData<ExerciseEntity>> call(int workoutID, int type, ExerciseEntity exercise) async {
    return await _iAddExerciseDataSource(workoutID, type, exercise);
  }

}