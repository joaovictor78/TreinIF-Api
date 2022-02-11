import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '../repositories/i_datasources/i_update_individual_workout_name_datasource.dart';

class UpdateIndividualWorkoutNameDataSource
    implements IUpdateIndividualWorkoutNameDataSource {
  IHttpClient _client;
  UpdateIndividualWorkoutNameDataSource(this._client);
  @override
  Future<ReturnData> call(int workoutID, String name) async {
    try {
      await _client
          .put("/individual/workouts/$workoutID", data: {"name": name});
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
