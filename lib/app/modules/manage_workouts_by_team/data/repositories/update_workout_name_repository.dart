import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_update_workout_name_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_update_workout_name_repository.dart';

class UpdateWorkoutNameRepository implements IUpdateWorkoutNameRepository {
  UpdateWorkoutNameRepository(this._iUpdateWorkoutNameDataSource);
  final IUpdateWorkoutNameDataSource _iUpdateWorkoutNameDataSource;

  @override
  Future<ReturnData> call(int teamID, int workoutID, String name) {
    return _iUpdateWorkoutNameDataSource(teamID, workoutID, name);
  }
}
