import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_remove_individual_workout_datasource.dart';

class RemoveIndividualWorkoutDataSource
    implements IRemoveIndividualWorkoutDataSource {
  IHttpClient _client;
  RemoveIndividualWorkoutDataSource(this._client);
  @override
  Future<ReturnData> call(int individualWorkout) async {
    try {
      await _client.delete("/individual/workouts/$individualWorkout");
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
