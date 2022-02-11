import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_remove_workout_repository.dart';

class RemoveWorkoutUseCase {
  RemoveWorkoutUseCase(this._iRemoveWorkoutRepository);
  final IRemoveWorkoutRepository _iRemoveWorkoutRepository;
  Future<ReturnData> call(int teamID, int workoutID) async {
    return await _iRemoveWorkoutRepository(teamID, workoutID);
  }
}
