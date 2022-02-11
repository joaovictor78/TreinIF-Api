import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/add_exercises_to_workout/domain/i_repositories/i_add_exercise_repository.dart';
import '/app/core/utils/return_data.dart';

class AddExerciseUseCase{
  IAddExerciseRepository _iAddExerciseRepository;
  AddExerciseUseCase(this._iAddExerciseRepository);
  Future<ReturnData> call(int workoutID, int type, ExerciseEntity exercise) async {
     return await _iAddExerciseRepository(workoutID, type, exercise);
  }
}