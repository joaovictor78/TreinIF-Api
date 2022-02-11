import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_update_workout_name_datasource.dart';

class UpdateWorkoutNameDataSource implements IUpdateWorkoutNameDataSource {
  UpdateWorkoutNameDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData> call(int teamID, int workoutID, String name) async {
    try {
      await _client.put("/teams/$teamID/workouts/$workoutID", data: { "name" : name });
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
