import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/workout_entity.dart';

abstract class ICreateWorkoutRepository {
  Future<ReturnData<WorkoutEntity>> call(int teamId, String workoutName);
}
