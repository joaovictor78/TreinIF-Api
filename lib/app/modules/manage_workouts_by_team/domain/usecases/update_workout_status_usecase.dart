import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_update_workout_status_repository.dart';
import '/app/core/utils/return_data.dart';

class UpdateWorkoutStatusUseCase {
  UpdateWorkoutStatusUseCase(this._iUpdateWorkoutStatusRepository);
  final IUpdateWorkoutStatusRepository _iUpdateWorkoutStatusRepository;
  Future<ReturnData> call(int teamID, int workoutID) async {
    return await _iUpdateWorkoutStatusRepository(teamID, workoutID);
  }
}
