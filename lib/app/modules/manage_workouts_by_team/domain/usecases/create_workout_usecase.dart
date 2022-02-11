import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_create_workout_repository.dart';
import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/workout_entity.dart';

class CreateWorkoutUseCase {
  CreateWorkoutUseCase(this._iCreateWorkoutRepository);
  final ICreateWorkoutRepository _iCreateWorkoutRepository;
  Future<ReturnData<WorkoutEntity>> call(int teamId, String workoutName) async {
    return await _iCreateWorkoutRepository(teamId, workoutName);
  }
}
