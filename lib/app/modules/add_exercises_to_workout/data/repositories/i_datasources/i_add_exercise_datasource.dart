import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_entity.dart';

abstract class IAddExerciseDataSource{
  Future<ReturnData<ExerciseEntity>> call(int workoutID, int type, ExerciseEntity exercise);
}