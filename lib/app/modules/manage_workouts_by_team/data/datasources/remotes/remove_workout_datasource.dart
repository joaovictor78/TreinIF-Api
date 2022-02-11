import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_remove_workout_datasource.dart';

class RemoveWorkoutDataSource implements IRemoveWorkoutDataSource {
  final IHttpClient _client;
  RemoveWorkoutDataSource(this._client);
  @override
  Future<ReturnData> call(int teamID, int workoutID) async {
    try {
      await _client.delete("/teams/$teamID/workouts/$workoutID");
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
