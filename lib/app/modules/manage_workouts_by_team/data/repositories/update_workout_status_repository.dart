import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_update_workout_status_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_update_workout_status_repository.dart';

class UpdateWorkoutStatusRepository implements IUpdateWorkoutStatusRepository {
  UpdateWorkoutStatusRepository(this._iUpdateWorkoutStatusDataSource);
  final IUpdateWorkoutStatusDataSource _iUpdateWorkoutStatusDataSource;
  @override
  Future<ReturnData> call(int teamID, int workoutID) async {
    return _iUpdateWorkoutStatusDataSource(teamID, workoutID);
  }
}
