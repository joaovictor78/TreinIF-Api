import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_remove_workout_datasource.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_remove_workout_repository.dart';

class RemoveWorkoutRepository implements IRemoveWorkoutRepository {
  RemoveWorkoutRepository(this._iRemoveWorkoutDataSource);
  final IRemoveWorkoutDataSource _iRemoveWorkoutDataSource;
  @override
  Future<ReturnData> call(int teamID, int workoutID) async {
    return await _iRemoveWorkoutDataSource(teamID, workoutID);
  }
}
