import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_update_workout_name_repository.dart';

import '/app/core/utils/return_data.dart';

class UpdateWorkoutNameUseCase {
  UpdateWorkoutNameUseCase(this._iUpdateWorkoutNameRepository);
  final IUpdateWorkoutNameRepository _iUpdateWorkoutNameRepository;
  Future<ReturnData> call(int teamID, int workoutID, String name) async {
    return await _iUpdateWorkoutNameRepository(teamID, workoutID, name);
  }
}
